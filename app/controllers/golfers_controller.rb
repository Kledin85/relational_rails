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
    golfer = Golfer.create(golfer_params, course_id: "#{parent.id}")
    redirect_to "/golfers"
  end

  def edit
    @golfer = Golfer.find(params[:id])
  end

  def update

  end

  def destroy
    golfer = Golfer.find(params[:id])
    golfer.destroy
    redirect_to "/golfers"
  end

  private

  def golfer_params
    params.permit(
      :name,
      :adult,
      :tee_time,
      :course_name
    )
  end

end