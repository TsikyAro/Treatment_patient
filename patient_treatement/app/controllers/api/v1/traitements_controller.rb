class Api::V1::TraitementsController < ApplicationController
    skip_before_action :verify_authenticity_token 

    def index
      traitements = Traitement.select(:id,:nomtraitement)
      render json: traitements
    end
  
end
