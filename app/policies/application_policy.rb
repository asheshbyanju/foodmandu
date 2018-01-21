class ApplicationPolicy
  attr_reader :user, :restaurant

  def initialize(user, restaurant)
    @user = user
    @restaurant = restaurant
  end

  def index?
    false
  end

  def show?
    #scope.where(:id => restaurant.id).exists?
    false
  end

  def create?
    false
  end

  def new?
    create?
  end

  def update?
    false
  end

  def edit?
    update?
  end

  def destroy?
    false
  end

  def scope
    Pundit.policy_scope!(user, restaurant.class)
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope
    end
  end
end
