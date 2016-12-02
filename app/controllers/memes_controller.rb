require 'memeutil'
class MemesController < ApplicationController
  before_action :set_meme, only: [:show, :update, :destroy, :vote]
  before_action :authenticate_user!, except: [:index, :popular, :show, :random, :search]

  # GET /memes
  # GET /memes.json
  def index
  @memes = Meme.all.order('memes.created_at DESC').limit(500).paginate(:page => params[:page])
    @votes = Vote.where(meme: @memes.map{|m| m.id})
    if user_signed_in?
      @user_votes = @votes.where(user: current_user)
    else
      @user_votes = Vote.none
    end
    @votes = @votes.group_by(&:meme_id)
  end

  def popular
    @memes = Meme.select("*, (SELECT COALESCE(SUM(votes.value),0) FROM votes
                         WHERE votes.meme_id = memes.id) AS score")
      .order("score DESC, memes.created_at DESC").limit(500).paginate(:page => params[:page])
    @votes = Vote.where(meme: @memes.map{|m| m.id})
    if user_signed_in?
      @user_votes = @votes.where(user: current_user)
    else
      @user_votes = Vote.none
    end
    @votes = @votes.group_by(&:meme_id)
  end

  # GET /search
  def search
    if params[:query].present?
      condition = "%#{params[:query].downcase}%"
      @memes = Meme.where("lower(top_caption) LIKE ? OR lower(bottom_caption) LIKE ?", condition, condition)
      @votes = Vote.where(meme: @memes.map{|m| m.id})
      if user_signed_in?
        @user_votes = @votes.where(user: current_user)
      else
        @user_votes = Vote.none
      end
      @votes = @votes.group_by(&:meme_id)
      respond_to do |format|
        format.html { }
        format.js { @memes = @memes.limit(10) }
      end
    else
      redirect_to :root
    end
  end

  # GET /memes/1
  # GET /memes/1.json
  def show
    if user_signed_in?
      @user_vote = Vote.find_by(user: current_user, meme: @meme)
    end
    @user_vote ||= Vote.new(value: 0)
    @score = Vote.where(meme: @meme).sum(:value)
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
        vote.destroy
      else
        vote.update(value: value)
        ret = value
      end
    else
      Vote.create(meme: @meme, user: current_user, value: value)
      ret = value
    end
    render json: { :result => ret, :score => Vote.where(meme: @meme).sum(:value) }
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
