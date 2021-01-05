class SessionsController < ApplicationController
  def create
     
      if !params[:email]
        @nurse = Nurse.find_by(email: email) 
        if @nurse 
          if !@nurse[:uid]
            @nurse.uid = auth[:uid]
            @nurse.save 
          end 
            session[:nurse_id] = @nurse.id
            redirect_to nurses_path 
        else 
          render "NOT IN OUR SYSTEM"
        end

      else

        @user = User.find_by(email: params[:email])
        
        if @user && @user.authenticate(params[:password])
        # return head(:forbidden) unless @user.authenticate(params[:password])
            session[:user_id] = @user.id
            @nurse = Nurse.find(@user.nurse_id)
            redirect_to nurses_path  
        else
            redirect_to sessions_login_path
        end
      end

  end
  
  def destroy
      session.clear 
      redirect_to sessions_login_path
  end
  private

  def auth
    request.env['omniauth.auth']
  end

  def email 
    auth[:extra][:raw_info][:email]
  end

end
