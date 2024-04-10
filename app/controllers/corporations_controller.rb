class CorporationsController < ApplicationController

  def index
    @corporations = Corporation.all
    @corporations = Corporation.includes(:adherents)
  end

  def show
    @corporation = Corporation.find(params[:id])
    @adherents = @corporation.adherents.includes(:formulaires)
    @adherents = @adherents.joins(:formulaires).where("adherents.nom LIKE :search OR formulaires.nom_prenom LIKE :search", search: "%#{params[:search]}%") if params[:search].present?
  end


  #def update
  #  @corporation = Corporation.find(params[:id])
  #  if @corporation.update(corporation_params)
  #    redirect_to root_path, notice: "Nom mis à jour avec succès"
  #  else
  #    render :edit
  #  end
  #end

  #private

  #def corporation_params
  #  params.require(:corporation).permit(:nom)
  #end


end