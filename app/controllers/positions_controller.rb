class PositionsController < ApplicationController
  def index
    @positions = Position.all
  end

  def show
    @position = Position.find(params[:id])

    @status = @position.submissions.any? { |submission| current_user == submission.user }

    @images = ["coder.svg", "coordinator.svg", "manager.svg", "socialmedia.svg", "supervisor.svg"]

  end
end
