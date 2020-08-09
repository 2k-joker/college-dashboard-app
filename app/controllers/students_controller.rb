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

  def edit
    @student = Student.find(params[:id])
  end

  def show
    @student = Student.find(params[:id])
  end

  def update
    @student = Student.find(params[:id])
    if @student.update(white_list_params)
      flash[:notice] = 'Successfully updated profile'
      redirect_to student_path(@student)
    else
      flash[:alert] = 'Whoops! Something went wrong. Please try again'
      render 'edit'
    end
  end

  private

  def white_list_params
    params.require(:student).permit(:name, :email)
  end
end