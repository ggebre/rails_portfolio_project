class BodyMassesController < ApplicationController
  def index 
    if logged_in?
      if params[:patient_id]
          @body_masses = Patient.find(params[:patient_id]).body_masses
      else
        @body_masses = BodyMass.all
      end
    else
      render 'sessions/login'
    end
  end
  def new 
    if logged_in?
      if params[:patient_id]
          @patient = Patient.find(params[:patient_id])
          @body_mass = @patient.body_masses.build
          render :layout => 'patient'
      end
    else
      render 'sessions/login'
    end
  end

  def create
    
    @body_mass = BodyMass.new(body_mass_params)
      if @body_mass.valid? 
          @body_mass.save 
          @patient = Patient.find(@body_mass.patient_id)
          redirect_to @patient 
      end
  end

  def body_mass_params 
    params.require(:body_mass).permit(:patient_id, :weight, :height)
  end
end
