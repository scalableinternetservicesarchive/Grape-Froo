class MemesController < ApplicationController
  before_action :set_meme, only: [:show, :edit, :update, :destroy, :vote]
  before_action :authenticate_user!, except: [:index, :show]

  # GET /memes
  # GET /memes.json
  def index
    @memes = Meme.all
  end

  # GET /memes/1
  # GET /memes/1.json
  def show
  end

  # GET /memes/new
  def new
    @meme = Meme.new
  end

  # GET /memes/1/edit
  def edit
    authorize @meme
  end

  # POST /memes
  # POST /memes.json
  def create
    @meme = Meme.new(meme_params)
    @meme.user = current_user
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
      format.html { redirect_to memes_url, notice: 'Meme was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def upvote
    @vote = Vote.where(meme_id: params[:id], user: current_user)

    @return = 0

    if @vote.count != 0
      @vote_value = @vote[0].value
      @vote.destroy_all

      if @vote_value == false
        Vote.create(meme_id: params[:id], user: current_user, value: true)
        @return = -1
      end
    else
      Vote.create(meme_id: params[:id], user: current_user, value: true)
      @return = -1
    end

    # Return value
    #   -1, upvote created
    #   0, any vote deleted
    #   1, downvote created

    render :json => @return
  end

  def downvote
    @vote = Vote.where(meme_id: params[:id], user: current_user)

    if @vote.count != 0
      @vote_value = @vote[0].value
      @vote.destroy_all

      @return = 0;

      if @vote_value == true
        Vote.create(meme_id: params[:id], user: current_user, value: false)
        @return = 1
      end
    else
      Vote.create(meme_id: params[:id], user: current_user, value: false)
      @return = 1
    end

    # Return value
    #   -1, upvote created
    #   0, any vote deleted
    #   1, downvote created

    render :json => @return
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meme
      @meme = Meme.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def meme_params
      params.require(:meme).permit(:url, :top_caption, :middle_caption, :bottom_caption, :template_id, :user_id)
    end
end
