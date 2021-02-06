class SubmissionPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.role == "intern"
        scope.where(user_id: user.id)
      end
    end
  end

  def new?
    user.role == "intern"
  end

  def create?
    user.role == "intern"
  end

  def edit?
    update?
  end

  def update?
    user.role == "business"
  end
end
