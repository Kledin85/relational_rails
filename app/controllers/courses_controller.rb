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
end