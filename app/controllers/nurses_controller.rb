class NursesController < ApplicationController
  # render :layout => "nurse"
  def index
    
    if logged_in?
      @nurse = session[:nurse_id] ? current_user : Nurse.find(current_user.nurse_id)
      render :layout => "drop_down"
    else
      render 'sessions/login'
    end
  end

  

  def show
    if logged_in?
      @order = ""
      @mar = "active"
      @tar = ""
      @nurse = set_nurse 
      render :layout => "nurse"
    else 
      render 'sessions/login'
    end
  end

  def create
    @nurse = Nurse.new(nurse_params)
    if @nurse.valid?
      @nurse.save 
      redirect_to @nurse 
    else
      redirect_to new_nurse_path
    end
  end

  def new
    if logged_in?
      @nurse = Nurse.new 
    else
      render 'sessions/login'
    end
  end

  def edit
    if logged_in?
    @nurse = set_nurse 
    else
      render 'sessions/login'
    end
  end

  def update
    @nurse = set_nurse 
  end

  private 
  def set_nurse 
    Nurse.find(params[:id])
  end

  def nurse_params 
    params.require(:nurse).permit(:name)
  end
end
