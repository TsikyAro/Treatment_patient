class Api::V1::PatientTraitementsController < ApplicationController
  skip_before_action :verify_authenticity_token
    def create
      puts "Requête reçue : #{params.inspect}"
      patient = Patient.find_by(numerotelephone: params[:numerotelephone])
  
      if patient.nil?
        patient = Patient.create(nomPatient: params[:nomPatient], numerotelephone: params[:numerotelephone])
      end
  
      traitement = Traitement.find(params[:idtraitement])
      patient_traitement = PatientTraitement.create(patient: patient, traitement: traitement)
  
      if patient_traitement.persisted?
        render json: { message: "Traitement ajouté au patient" }, status: :created
      else
        render json: { error: patient_traitement.errors.full_messages }, status: :unprocessable_entity
      end
    end
  end
  