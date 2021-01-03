class VitalsController < ApplicationController

    def index 
        if logged_in? 
            if params[:patient_id]
                @vitals = Patient.find(params[:patient_id]).vitals 
            else
                @vitals = Vital.all
            end
        else 
            # redirect_to sessions_login_path
            render 'sessions/login'
        end
    end
    def new 
        if logged_in?
            if params[:patient_id]
                @patient = Patient.find(params[:patient_id])
                @vital = @patient.vitals.build
                render :layout => 'patient'
            end
        else 
            render 'sessions/login'
        end
    end

    def create
    
        @vital = Vital.new(vital_params)
        if @vital.valid? 
            @vital.save 
            @patient = Patient.find(@vital.patient_id)
            redirect_to @patient
        end
    end

    def vital_params 
        params.require(:vital).permit(:patient_id, :temperature, :pressure, :pulse)
      end
end