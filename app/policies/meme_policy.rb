class MemePolicy < ApplicationPolicy
  attr_reader :user, :meme

  def initialize(user, meme)
    @user = user
    @meme = meme
  end

  def update?
    user == meme.user
  end

  def destroy?
    user == meme.user
  end
end
