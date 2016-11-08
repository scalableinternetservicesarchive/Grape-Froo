class UsersController < ApplicationController
before_action :set_user, only: [:show, :memes, :templates]

  def show
  end

  def memes
    @memes = @user.meme.order(created_at: :desc).paginate(:page => params[:page])
  end

  def templates
    @templates = @user.template.order(created_at: :desc).paginate(:page => params[:page])
  end

  private
  	def set_user
  		@user = User.find(params[:id])
      @user_str = (user_signed_in? and @user == current_user) ? "My" : @user.username.possessive
  	end
end
