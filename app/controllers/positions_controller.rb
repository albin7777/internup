class PositionsController < ApplicationController

  def index
    @positions = policy_scope(Position).order(created_at: :desc)
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

  def new
    @position = Position.new
    authorize @position
  end

  def create
    @position = Position.new(position_params)
    @position.user = current_user
    authorize @position
    if @position.save
      redirect_to position_path(@position), success: "your position have been posted."
    else
      render :new
    end
  end

  def show
    @position = Position.find(params[:id])
    @status = @position.submissions.any? { |submission| current_user == submission.user }
    @images = ["coder.svg", "coordinator.svg", "manager.svg", "socialmedia.svg", "supervisor.svg"]
    authorize @position
  end

private

def position_params
  params.require(:position).permit(:title, :description, :salary, :duration)
end
end
