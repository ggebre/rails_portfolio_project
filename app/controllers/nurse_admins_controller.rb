class NurseAdminsController < ApplicationController
  def nurse_assignments
    @nurses = Nurse.all 
    @floors = Room.floors 
  end

  def assignments 
    if logged_in?
      if Nurse.nurse_assigned(params[:nurse])
        redirect_to nurse_assignment_path
      else
        redirect_to nurse_assignment_path
      end
    else
      render 'sessions/login'
    end
  end
  def index 
    @nurse_admins = NurseAdmin.all 
  end
  def show
    @nurse_admins = NurseAdmin.all 
  end

  
  def new 
    @nurse_admin = NurseAdmin.new 
  end

  def create
    # create an association between a nurse and floor...assign a nurse to a floor 
  end

end
