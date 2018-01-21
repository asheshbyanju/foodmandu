 class RestaurantPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      #scope.where(role: :admin).or(
      scope.where(user_id: @user.try(:id)) 
      #)
    end
  end

  def new?
  user_is_owner_of_restaurant?
  end

 def create? ; user_is_owner_of_restaurant? ; end

  def update?
  user_is_owner_of_restaurant?
  end

  def delete?
  user_is_owner_of_restaurant?
  end

  def user_is_owner_of_restaurant?
  	@user == @restaurant.user
  end
end
