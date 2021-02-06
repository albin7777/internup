class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      positions = user.positions.pluck(:id)
      applications = Submission.where(position_id: positions)
      applicants = applications.pluck(:user_id).uniq
      scope.where(id: applicants)
    end
  end
end
