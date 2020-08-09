class StudentsCoursesController < ApplicationController
  def create
    course_to_enroll = Course.find(params[:course_id])
    unless current_user.courses.include?(course_to_enroll)
      StudentsCourse.create(course: course_to_enroll, student: current_user)
      flash[:notice] = "Successfully enrolled in #{course_to_enroll.name}"
      redirect_to current_user
    else
      flash[:notice] = "Whoops! Something went wrong :shrug:"
      redirect_to root_path
    end
  end
end