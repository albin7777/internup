class SubmissionsController < ApplicationController
  def index
    @submissions = Submission.all
  end

  def new
    @submission = Submission.new
  end

  def create
    @submission = Submission.new
    @position = Position.find(params[:position_id])
    @submission.user_id = current_user
    @submission.position = @position
    if @submission.save
      redirect_to submissions_path, notice: "Thank you for your application. Good luck!"
    else
      render :new
    end
  end

  def destroy
    @submission = Submission.find(params[:id])
    @submission.destroy
    redirect_to submission_path(@submission.position)
  end

end
