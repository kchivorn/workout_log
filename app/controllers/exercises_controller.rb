class ExercisesController < ApplicationController
  before_action :set_workout

  def create
    @exercise = @workout.exercises.create exercise_params

    redirect_to @workout
  end

  private

  def exercise_params
    params[:exercise].permit(:name, :sets, :reps)
  end

  def set_workout
    @workout = Workout.find(params[:workout_id])
  end
end
