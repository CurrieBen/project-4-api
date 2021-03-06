require 'test_helper'

class JobsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @job = jobs(:one)
  end

  test "should get index" do
    get jobs_url, as: :json
    assert_response :success
  end

  test "should create job" do
    assert_difference('Job.count') do
      post jobs_url, params: { job: { address_line1: @job.address_line1, address_line2: @job.address_line2, address_line3: @job.address_line3, address_line4: @job.address_line4, chosen_applicant_id: @job.chosen_applicant_id, date: @job.date, description: @job.description, hourly_rate: @job.hourly_rate, title: @job.title, user_id: @job.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show job" do
    get job_url(@job), as: :json
    assert_response :success
  end

  test "should update job" do

    patch job_url(@job), params: { job: { address_line1: @job.address_line1, address_line2: @job.address_line2, address_line3: @job.address_line3, address_line4: @job.address_line4, chosen_applicant_id: @job.chosen_applicant_id, date: @job.date, description: @job.description, hourly_rate: @job.hourly_rate, title: @job.title, user_id: @job.user_id } }, as: :json

    assert_response 200
  end

  test "should destroy job" do
    assert_difference('Job.count', -1) do
      delete job_url(@job), as: :json
    end

    assert_response 204
  end
end
