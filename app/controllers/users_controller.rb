class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def memes
  	@user = User.find(params[:id])
  end

  def templates
  	@user = User.find(params[:id])
  end
end
