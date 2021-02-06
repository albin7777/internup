class BusinessPositionsController < ApplicationController
  skip_after_action :verify_policy_scoped, only: [:index, :new, :create]
  def index
    @positions = current_user.positions.order(created_at: :desc)
  end

  def show
    @position = Position.find(params[:id])
    authorize @position
  end

  def new
    @position = Position.new
    authorize @position
  end

  def create
    @position = Position.new
    @position.user = current_user
    authorize @position
    if @position.save
      redirect_to business_position_path, success: "your position have been posted."
    else
      render :new
    end
  end

  def edit
    @position = Position.find(params[:id])
    authorize @position
  end

  def update
    @position = Position.find(params[:id])
    @position.update(position_params)
    authorize @position
    redirect_to business_position_path(@position)
  end

  #def destroy
  #end
  def submissions
    @submissions = current_user.submissions_as_owner
    skip_authorization
  end

end
