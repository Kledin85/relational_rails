class GolfersController < ApplicationController
  def index
    @golfers = Golfer.limit_by(adult: true)
  end

  def show
    @golfer = Golfer.find(params[:id])
  end

  def new
  end

  def create
    # binding.pry
    parent = Course.find_by(name: params[:course_name])
    golfer = Golfer.create(name: params[:name], course_id: "#{parent.id}")
    redirect_to "/golfers"
  end

  def edit
    @golfer = Golfer.find(params[:id])
  end

  def update

  end

end