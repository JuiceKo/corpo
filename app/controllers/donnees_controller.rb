class DonneesController < ApplicationController

  def edit
    @corporation = Corporation.find(params[:corporation_id])
    @donnee = @corporation.donnees.find_by(annee: params[:annee])
  end

  def find_by_year
    corporation = Corporation.find(params[:corporation_id])
    donnee = corporation.donnees.find_by(annee: params[:selected_year])
    render json: { donnee_id: donnee&.id }
  end

end
