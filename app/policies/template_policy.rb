class TemplatePolicy < ApplicationPolicy
  attr_reader :user, :template

  def initialize(user, template)
    @user = user
    @template = template
  end


  def update?
    user == template.user
  end

  def destroy?
    user == template.user
  end
end
