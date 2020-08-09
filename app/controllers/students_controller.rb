class StudentsController < ApplicationController
  def index
    @students = Student.all
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(white_list_params)
    if @student.save
      flash[:notice] = 'Successfully signed up'
      redirect_to root_path
    else
      flash[:alert] = 'Whoops! Something went wrong. Please try again'
      render 'new'
    end
  end

  private

  def white_list_params
    params.require(:student).permit(:name, :email)
  end
end