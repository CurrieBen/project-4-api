class JobsController < ApplicationController
  before_action :set_job, only: [:show, :update, :destroy]

  # GET /jobs
  def index
    @jobs = Job.all

    render json: @jobs, include: [
      :pictures
    ]
  end

  # GET /jobs/1
  def show
    render json: @job
  end

  # POST /jobs
  def create
    @job = Job.new(Uploader.upload(job_params))
    @job.user = current_user
    @user = User.find_by_id(@job.user_id)

    if @job.save
      render json: @job, status: :created, location: @job
      UserMailer.new_job_email(@user, @job).deliver
    else
      render json: @job.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /jobs/1
  def update
    if @job.update(Uploader.upload(job_params))
      render json: @job
    else
      render json: @job.errors, status: :unprocessable_entity
    end
  end

  # DELETE /jobs/1
  def destroy
    @job.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job
      @job = Job.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def job_params
      params.require(:job).permit(:title, :description, :date, :hourly_rate, :address_line1, :address_line2, :address_line3, :address_line4, :chosen_applicant_id, :user_id, { applicant_ids: [] }, :base64, category_ids: [])
    end
end
