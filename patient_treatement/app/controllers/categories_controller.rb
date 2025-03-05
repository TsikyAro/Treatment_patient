class CategoriesController < ApplicationController
    def index
        @categories = Category.select(:id, :nomCategory)
    end

    def create
        @category = Category.new(category_params)

        if @category.save
            respond_to do |format|
                format.html { redirect_to categories_path, notice: "Catégorie créée avec succès." }
                format.js   
            end
        else
            respond_to do |format|
                format.html { render :index, status: :unprocessable_entity }
                format.js
            end
        end
    end

    def destroy
        @category = Category.find(params[:id])
        @category.destroy
        redirect_to categories_path, notice: "Catégorie supprimée avec succès."
    end

    private

    def category_params
        params.require(:category).permit(:nomCategory)
    end
end
