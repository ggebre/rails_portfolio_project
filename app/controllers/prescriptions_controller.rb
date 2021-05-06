class PrescriptionsController < ApplicationController
  def index
    if logged_in?
      if params[:patient_id]
        @prescriptions = Patient.find(params[:patient_id]).prescriptions 
      else
        @prescriptions = Prescription.all 
      end
    else
      render 'sessions/login'
    end
  end
  def show
    if logged_in?
      @prescription = Prescription.find(params[:id])
    else
      render 'sessions/login'
    end
  end

  def create
    @prescription = Prescription.new(prescription_params)
    if @prescription.valid?
        @prescription.save 
        redirect_to prescription_path @prescription
    else
      redirect_to prescriptions_path
    end
  end

  def new
      if logged_in?
       @prescription = Prescription.new  
      else 
        render 'sessions/login'
      end
  end

  def edit
    @prescription = Prescription.find(params[:id])
  end

  

  def update
    @prescription = Prescription.find(params[:id])
    @prescription.update(prescription_params)
    redirect_to @prescription
  end

  def prescription_params 
    params.require(:prescription).permit(:name, :description, :frequency, :dose, :quantity)
  end
end
