class PositionsController < ApplicationController
  def index
    @positions = Position.all
    @images = ["coder.svg", "coordinator.svg", "manager.svg", "socialmedia.svg", "supervisor.svg"]
  end

  def show
    @position = Position.find(params[:id])
  end
end
