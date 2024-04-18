class AdherentsController < ApplicationController
  def new_avec_adherent
    @corporation = Corporation.find(params[:corporation_id])
    @adherent = Adherent.new(corporation: @corporation)
    @formulaire = @adherent.formulaires.build
    @annee = trouver_annee
    @donnees = Donnee.find_by(annee: @annee)
  end

  def create_avec_adherent
    @corporation = Corporation.find(params[:corporation_id])
    @formulaire = Formulaire.new(formulaire_params)
    @adherent = Adherent.new(nom: @formulaire.nom_prenom, corporation: @corporation)
    @formulaire.adherent = @adherent
    @formulaire.annee = Time.now.year

    if @adherent.save && @formulaire.save
      redirect_to corporation_path(@corporation), notice: 'Adherent and Formulaire were successfully created.'
    else
      render :new_avec_adherent
    end
  end

  def trouver_annee
    current_year = Time.now.year
    year = Donnee.where(corporation_id: @corporation.id, annee: current_year).exists? ? current_year : Donnee.where(corporation_id: @corporation.id).where("annee < ?", current_year).order(annee: :desc).pluck(:annee).first
    year
  end



  private

  def adherent_params
    params.require(:adherent).permit(:nom)
  end

  def formulaire_params
    params.require(:formulaire).permit(:raison_sociale, :nom_prenom, :adresse, :cp_ville, :telephone, :portable, :email, :statut, :forme_juridique, :siret, :nb_salaries, :nb_apprentis, :mode_paiement, :lieu, :date, :titulaire_compte, :adresse_sepa, :cp_ville_sepa, :iban_sepa, :bic_sepa, :lieu_date_sepa, :annee)
  end

end
