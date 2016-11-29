require 'memeutil'
class MemesController < ApplicationController
  before_action :set_meme, only: [:show, :update, :destroy, :vote]
  before_action :authenticate_user!, except: [:index, :show, :random]

  # GET /memes
  # GET /memes.json
  def index
    @memes = Meme.all.order('memes.created_at DESC').includes(:user)
    @votes = Vote.where(meme: @memes.map{|m| m.id}, user: current_user)
  end

  # GET /memes/1
  # GET /memes/1.json
  def show
  end

  # GET /memes/new
  def new
    @meme = Meme.new
  end

  # POST /memes
  # POST /memes.json
  def create
    @meme = Meme.new(meme_params)
    @meme.user = current_user
    output = Memeutil.memeify(@meme.template.image.url, @meme.top_caption, @meme.bottom_caption)
    @meme.image = output
    respond_to do |format|
      if @meme.save
        format.html { redirect_to @meme, notice: 'Meme was successfully created.' }
        format.json { render :show, status: :created, location: @meme }
      else
        format.html { render :new }
        format.json { render json: @meme.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /memes/1
  # PATCH/PUT /memes/1.json
  def update
    authorize @meme
    respond_to do |format|
      if @meme.update(meme_params)
        format.html { redirect_to @meme, notice: 'Meme was successfully updated.' }
        format.json { render :show, status: :ok, location: @meme }
      else
        format.html { render :edit }
        format.json { render json: @meme.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /memes/1
  # DELETE /memes/1.json
  def destroy
    authorize @meme
    @meme.destroy
    respond_to do |format|
      format.html { redirect_to memes_url, notice: 'Meme was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  # return 1 for upvote created
  #        0 for vote deleted
  #       -1 for downvote created
  def vote
    vote = Vote.find_by(meme: @meme, user: current_user)
    value = params[:value].to_i
    ret = 0
    if vote.present?
      if vote.value == value
        vote.delete
      else
        vote.update(value: value)
        ret = value
      end
    else
      Vote.create(meme: @meme, user: current_user, value: value)
      ret = value
    end
    render json: ret
  end

  def random
    if Meme.count == 0
      redirect_to root_url
    else
      random_meme = Meme.offset(rand(Meme.count)).first
      redirect_to random_meme
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meme
      @meme = Meme.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def meme_params
      params.require(:meme).permit(:image, :top_caption, :bottom_caption, :template_id, :user_id)
    end
end
