class Api::V1::PatientsController < ApplicationController
    skip_before_action :verify_authenticity_token

    def check_patient
      patient = Patient.find_by(numerotelephone: params[:numerotelephone])
  
      if patient
        render json: { patient: patient }, status: :ok
      else
        new_patient = Patient.create(nomPatient: params[:nomPatient], numerotelephone: params[:numerotelephone])
        if new_patient.persisted?
          render json: { patient: new_patient }, status: :created
        else
          render json: { error: new_patient.errors.full_messages }, status: :unprocessable_entity
        end
      end
    end
  
    private
  
    def set_patient
      @patient = Patient.find(params[:id])
    end
end
