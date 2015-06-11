class DashboardController < ApplicationController
  layout "application"

  def index
    @students = Student.all
    @courses = Course.all
    @classrooms = ClassRoom.all
  end


end
