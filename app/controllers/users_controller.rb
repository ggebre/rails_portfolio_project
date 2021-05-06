class UsersController < ApplicationController
  

  def create
    
    @nurse = Nurse.find_by(email: params[:user][:email])
    if @nurse
      @user = User.new(user_params)
      @user.nurse = @nurse
      if @user.save 
          session[:user_id] = @user.id
          redirect_to nurses_path  
      else  
          redirect_to sessions_login_path
      end
    else 
        redirect_to new_user_path
    end
  end

  def new
    @user = User.new 
  end

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
