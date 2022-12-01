class CourseGolfersController < ApplicationController
  def index
    course = Course.find(params[:course_id])
    @golfers = course.golfers
  end
end