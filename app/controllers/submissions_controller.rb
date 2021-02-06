class SubmissionsController < ApplicationController
  def index
    @submissions = policy_scope(Submission).order(created_at: :desc)
  end

  def new
    @submission = Submission.new
    @position = Position.find(params[:position_id])
    authorize @submission
  end

  def create
    @submission = Submission.new(submission_params)
    @position = Position.find(params[:position_id])
    @submission.user = current_user
    @submission.position = @position
    @submission.status = 'pending'
    authorize @submission
    if @submission.save
      redirect_to submissions_path, success: "Thank you for your application. Good luck!"
    else
      render :new
    end
  end

  def edit
    @submission = Submission.find(params[:id])
  end

  def update
    @submission = Submission.find(params[:id])
    @submission.update(submission_params)
    authorize @submission
    redirect_to business_submission_path(@submission)
  end

  def destroy
    @submission = Submission.find(params[:id])
    @submission.destroy
    redirect_to submission_path(@submission.position)
  end

  private

  def submission_params
    params.require(:submission).permit(:cv, :status)
  end
end
