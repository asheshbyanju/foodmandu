class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(role: :admin)
    end
  end
   def new?
  user_is_admin?
  end

 def create? ; user_is_admin? ; end

  def update?
  user_is_admin?
  end

  def delete?
  user_is_admin?
  end

  def user_is_admin?
  	@user == User.all
  end
end
