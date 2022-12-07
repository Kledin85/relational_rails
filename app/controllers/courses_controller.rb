class CoursesController < ApplicationController
  def index
    @courses = Course.all
  end

  def show
   @course = Course.find(params[:id])
  end
  
  def new
  end

  def create
    course = Course.create(name: params[:name])
    redirect_to "/courses"
  end

  def edit
    @course = Course.find(params[:id])
  end

  def update
    course = Course.find(params[:id])
    course.update(course_params)
    redirect_to '/courses'
  end

  def destroy
    course = Course.find(params[:id])
    golfers = course.golfers
    # golfers.destroy
    course.destroy
    redirect_to "/courses"
  end

private
  def course_params
    params.permit(:name)
  end
end