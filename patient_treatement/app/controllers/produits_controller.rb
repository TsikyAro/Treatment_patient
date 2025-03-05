class ProduitsController < ApplicationController

    def index
        @produits = Produit.all
    end
    
    def create
      @produit = Produit.new(produit_params)
      if @produit.save
        redirect_to @produit
      else
        render 'new'
      end
    end
  
    private
  
    def produit_params
      params.require(:produit).permit(:nom, :prix)
    end
end
  
