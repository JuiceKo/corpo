class FormulairesController < ApplicationController

  def show
    @corporation = Corporation.find(params[:corporation_id])
    @adherent = Adherent.find(params[:adherent_id])
    @formulaire = @adherent.formulaires.find_by(annee: params[:year])
  end

end
