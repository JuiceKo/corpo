class CorporationsController < ApplicationController

  def index
    @corporations = Corporation.all
    @corporations = Corporation.includes(:adherents)
  end

  def show
    @corporation = Corporation.find(params[:id])
    @q = @corporation.adherents.ransack(params[:q])
    @adherents = @q.result(distinct: true).includes(:formulaires)
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