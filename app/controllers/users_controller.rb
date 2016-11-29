class UsersController < ApplicationController
before_action :set_user, only: [:show, :memes, :templates]


  def show
    redirect_to :user_memes
  end

  def memes
  end

  def templates
  end

  private
  	def set_user
  		@user = User.find(params[:id])
  	end
end
