class PositionsController < ApplicationController

  def index
    ##Need test after create business account
    # if current_user.role == 'business'
    #   @positions = Position.where(user: current_user)
    # end

    if current_user.role == 'intern'
      @positions = Position.all
    end

    if params[:query].present?
      @positions = @positions.search(params[:query])
    else
      @positions = Position.all
    end
  end

  def show
   @position = Position.find(params[:id])

    @status = @position.submissions.any? { |submission| current_user == submission.user }

    @images = ["coder.svg", "coordinator.svg", "manager.svg", "socialmedia.svg", "supervisor.svg"]
  end
end
