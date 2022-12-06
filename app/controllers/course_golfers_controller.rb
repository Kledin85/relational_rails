class CourseGolfersController < ApplicationController
  def index
    @course = Course.find(params[:course_id])
    @golfers = @course.golfers
   
  end

  def new
    @course = Course.find(params[:course_id])
  end

  def create
    @course = Course.create(name: params[:name])
    redirect_to "/courses/@course_1.id/golfers"
  end
end