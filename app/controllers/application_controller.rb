class ApplicationController < ActionController::Base
  before_action :require_user
  helper_method :current_user, :user_signed_in?

  def current_user
    @current_user ||= Student.find(session[:student_id]) if session[:student_id]
  end

  def require_user
    if !user_signed_in?
      flash[:notice] = "You gats to be logged in"
      redirect_to login_path
    end
  end

  def user_signed_in?
    !!current_user
  end
end
