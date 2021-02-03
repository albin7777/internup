class SubmissionPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user_id: user.id)
    end
  end

  def new?
    user.role == "intern"
  end

  def create?
    user.role == "intern"
  end
end
