class CoursesController < ApplicationController
  before_action :logged_in_user

  def index
    @courses = current_user.courses
  end

  def show
    @course = Course.find params[:id]
    @subjects = @course.subjects
    @users = @course.users
  end  

  private
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Please log in!"
      redirect_to login_url
    end
  end
end