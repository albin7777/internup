class BusinessPositionsController < ApplicationController
  def index
    @positions = current_user.positions
  end

  def show
    @position = Position.find(params[:id])
  end

  def new
    @position = Position.new
  end

  def create
    @position = Position.new
    @user = user.find(params[:id])

    @position.user = current_user

    if @position.save
      redirect_to business_position_path, success: "your position have been posted."
    else
      render :new
    end
  end

  def edit
    @position = Position.find(params[:id])
  end

  def update
    @position = Position.find(params[:id])
    @position.update(position_params)
    redirect_to business_position_path(@position)
  end

  #def destroy
  #end

end
