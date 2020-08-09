class SessionsController < ApplicationController
  def create
    student = Student.find_by(email: params[:sessions][:email].downcase)
    if student && student.authenticate(params[:sessions][:password])
      session[:student_id] = student.id
      flash[:notice] = "Successfully logged in"
      redirect_to student
    else
      flash.now[:notice] = "Invalid credentials"
      render 'new'
    end
  end

  def delete
    session[:student_id] = nil
    flash[:notice] = "Successfully logged out"
    redirect_to root_path
  end

  def new

  end
end