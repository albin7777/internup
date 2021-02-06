class PositionPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    user.role == "business"
  end

  def create?
    user.role == "business"
  end

  def show?
    true
  end
end
