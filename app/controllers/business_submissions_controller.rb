class BusinessSubmissionsController < ApplicationController
  #This is application from interns
  def index
    @position = Position.find(params[:business_position_id])
    @submissions = @position.submissions
      skip_authorization
  end

  def show
    @submission = Submission.find(params[:id])
    skip_authorization
  end
end
