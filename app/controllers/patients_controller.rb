class PatientsController < ApplicationController
  def index
    if logged_in?
      if session[:nurse_id]
          @patients = current_user.patients
          @nurse = current_user
      else
          id = current_user.nurse_id || params[:nurse_id]
          @nurse = Nurse.find(id)
          @patients = @nurse.patients
          
      end
      render 'nurses/show'
    else
      render 'sessions/login'
    end
  end
# before_action 
  def show
   if logged_in?
      @patient = set_patient 
      
      if session[:nurse_id]
        @nurse = current_user
      else
        @nurse = Nurse.find(current_user.nurse_id)
      end
      render :layout => 'patient'
   else
    render 'sessions/login'
   end
  end

  def create
    @patient = Patient.new(patient_params)
    if @patient.save 
      room = Room.find(params[:patient][:room])
      @patient.room = room 
      redirect_to @patient  
    else
      render :new 
    end
  end

  def new
    if logged_in?
      @patient = Patient.new 
    else 
      render 'sessions/login'
    end
  end

  def edit
    if logged_in?
      @patient = set_patient
      
      render :layout => 'patient'
    else
      render 'sessions/login'
    end
  end

  def update
    # accepts the prescription changes to the patient and updates the prescription delivery_time
    
    @patient = set_patient 
    if @patient.update(patient_params)
      redirect_to @patient 
    else
      redirect_to edit_patient_path @patient 
    end

  end

  private 
  def set_patient 
    Patient.find(params[:id])
  end

  def patient_params 
    params.require(:patient).permit(
      :name, address_attributes: [
        :address_1,
        :address_2,
        :city,
        :state,
        :zipcode,
        :email,
        :phone_number
      ],
      room_attributes: [
        :floor,
        :number
      ],
      prescriptions_attributes: [
        :name,
        :description,
        :frequency,
        :dose,
        :quantity
      ],
      prescription_ids: [])
  end
end
