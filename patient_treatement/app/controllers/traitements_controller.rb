class TraitementsController < ApplicationController
    def index
      @traitements = Traitement.includes(:category).all
      @traitement = Traitement.new
      @categories = Category.all
    end
  
    def create
        traitement_params = params.require(:traitement).permit(:nomtraitement, :category_id)
        traitement_data = {
          en: traitement_params[:nomtraitement]
        }
        
        @traitement = Traitement.new(category_id: traitement_params[:category_id], nomtraitement: traitement_data)
  
      if @traitement.save
        redirect_to traitements_path, notice: "Traitement ajouté avec succès!"
      else
        @traitements = Traitement.includes(:category).all
        @categories = Category.all
        render :index, status: :unprocessable_entity
      end
    end

    def update_json_field
        @traitement = Traitement.find(params[:id])
        nouvelle_langue = params[:langue]  
        nouveau_nom = params[:nom]       
      
        if nouvelle_langue.present? && nouveau_nom.present?
          traitement_data = @traitement.nomtraitement
          traitement_data[nouvelle_langue] = nouveau_nom
          if @traitement.update(nomtraitement: traitement_data)
            redirect_to traitements_path, notice: "Langue ajoutée avec succès."
          else
            redirect_to traitements_path, alert: "Erreur lors de l'ajout de la langue."
          end
        else
          redirect_to traitements_path, alert: "Veuillez remplir tous les champs."
        end
      end
      
  
    private
  
    def traitement_params
      params.require(:traitement).permit(:category_id, :nomtraitement)
    end
  end
  