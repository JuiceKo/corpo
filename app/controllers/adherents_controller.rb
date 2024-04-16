class AdherentsController < ApplicationController
  def new_avec_adherent
    @corporation = Corporation.find(params[:corporation_id])
    @adherent = Adherent.new(corporation: @corporation)
    @formulaire = @adherent.formulaires.build
  end

  def create_avec_adherent
    @corporation = Corporation.find(params[:corporation_id])
    @formulaire = Formulaire.new(formulaire_params)
    @adherent = Adherent.new(nom: @formulaire.nom_prenom, corporation: @corporation)
    @formulaire.adherent = @adherent

    if @adherent.save && @formulaire.save
      redirect_to corporation_path(@corporation), notice: 'Adherent and Formulaire were successfully created.'
    else
      render :new_avec_adherent
    end
  end

  def adherent_params
    params.require(:adherent).permit(:nom)
  end

  def formulaire_params
    params.require(:formulaire).permit(:raison_sociale, :nom_prenom, :adresse, :cp_ville, :telephone, :portable, :email, :statut, :forme_juridique, :siret, :nb_salaries, :nb_apprentis, :mode_paiement, :lieu, :date, :titulaire_compte, :adresse_sepa, :cp_ville_sepa, :iban_sepa, :bic_sepa, :lieu_date_sepa, :annee)
  end

end
