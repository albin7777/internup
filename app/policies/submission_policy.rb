class SubmissionPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.role == "intern"
        scope.where(user_id: user.id)
      else
        applicants = scope.joins(:position)
        applicants.where(positions: { user_id: user.id })
        applicants
      end
    end
  end

  def new?
    user.role == "intern"
  end

  def create?
    user.role == "intern"
  end
end
