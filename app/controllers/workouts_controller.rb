class WorkoutsController < ApplicationController
  before_action :set_workout, only: [:show, :edit, :update, :destroy]
  def index
    @workouts = Workout.all
  end

  def show

  end

  def new
    @workout = Workout.new
  end

  def create
    @workout = Workout.new(workout_params)
    if @workout.save
      redirect_to @workout, success: "The workout was successfully created."
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @workout.update_attributes(workout_params)
      redirect_to @workout, success: "The workout was successfully created."
    else
      render :edit
    end
  end

  def destroy
    @workout.destroy
    redirect_to root_path, notice: "The workout was successfully deleted."
  end

  private

  def workout_params
    params.require(:workout).permit(:date, :workout, :mood, :length)
  end

  def set_workout
    @workout = Workout.find(params[:id])
  end
end
