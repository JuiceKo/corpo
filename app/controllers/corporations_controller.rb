class CorporationsController < ApplicationController

  def index
    @corporations = Corporation.all
    @corporations = Corporation.includes(:donnees)
    @latest_donnees = {}
    @corporations.each do |corporation|
      @latest_donnees[corporation.id] = corporation.donnees.order(annee: :desc).first
    end
    @corporations = Corporation.includes(:adherents)
  end

  def show
    @corporation = Corporation.find(params[:id])
    @q = @corporation.adherents.ransack(params[:q])
    @adherents = @q.result(distinct: true).includes(:formulaires)
    @adherent_years = {}
    @adherents.each do |adherent|
      @adherent_years[adherent.id] = adherent.formulaires.pluck(:annee).uniq.sort.reverse
    end
  end

  def edit
    @corporation = Corporation.find(params[:id])
  end


  def update
    @corporation = Corporation.find(params[:id])
    if @corporation.update(corporation_params)
      redirect_to root_path, notice: 'Corporation mise à jour avec succès.'
    else
      flash.now[:alert] = 'Erreur lors de la mise à jour de la corporation.'
      render :edit    end
  end

  private

  def corporation_params
    params.require(:corporation).permit(:nom)
  end

end