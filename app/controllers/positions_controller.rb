class PositionsController < ApplicationController
  def index
    @positions = policy_scope(Position).order(created_at: :desc)
  end

  def show
    @position = Position.find(params[:id])
    @status = @position.submissions.any? { |submission| current_user == submission.user }
    @images = ["coder.svg", "coordinator.svg", "manager.svg", "socialmedia.svg", "supervisor.svg"]
    authorize @position
  end
end
