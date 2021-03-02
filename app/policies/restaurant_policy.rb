class RestaurantPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def create?
    user
  end

  def update?
    record.user == user || user.admin?
  end

  def destroy?
    update?
  end
end
