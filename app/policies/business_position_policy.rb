class BusinessPositionPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      raise
      scope.where(user_id: user.id)
    end
  end

  def show?
    true
  end

  def new?
    user.role == "business"
  end

  def create?
    user.role == "business"
  end

  def edit?
    user.role == "business"
  end

  def update?
    user.role == "business"
  end
end
