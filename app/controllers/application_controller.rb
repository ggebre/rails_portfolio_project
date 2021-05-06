class ApplicationController < ActionController::Base
    
    protect_from_forgery with: :exception

    helper_method :current_user, :logged_in?
    # before_action :require_login


  def current_user
      @current_user ||= User.find_by_id(session[:user_id]) || Nurse.find_by_id(session[:nurse_id])
  end

   def logged_in?
     current_user != nil
   end

   

  private

  def require_login
    unless logged_in?
      flash[:error] = "You must be logged in to access this section"
      redirect_to sessions_login_url # halts request cycle
    end
  end

end
