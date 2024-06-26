class FormulairesController < ApplicationController

  #before_action :set_formulaire, only: [:edit, :update]
  def show
    @corporation = Corporation.find(params[:corporation_id])
    @adherent = Adherent.find(params[:adherent_id])
    @formulaire = @adherent.formulaires.find_by(annee: params[:year])
    all_data = @corporation.donnees
    @max_year_data = all_data.order(annee: :desc).first if all_data.any?
    @donnees = Donnee.where(corporation_id: @corporation.id, annee: params[:year])
    @show_mode = true
  end

  def new
    @corporation = Corporation.find(params[:corporation_id])
    @adherent = Adherent.find(params[:adherent_id])
    @formulaire = Formulaire.new
    all_data = @corporation.donnees
    @max_year_data = all_data.order(annee: :desc).first if all_data.any?
    @formulaire.annee = Time.now.year
  end

  def create
    @corporation = Corporation.find(params[:corporation_id])
    @adherent = Adherent.find(params[:adherent_id])
    @formulaire = @adherent.formulaires.build(formulaire_params)
    @formulaire.annee = Time.now.year
    if @formulaire.save
      redirect_to @corporation, notice: "Formulaire créé avec succès"
    else
      render :new
    end
  end

  def edit
    @corporation = Corporation.find(params[:corporation_id])
    @adherent = Adherent.find(params[:adherent_id])
    @formulaire = Formulaire.find(params[:id])
    all_data = @corporation.donnees
    @max_year_data = all_data.order(annee: :desc).first if all_data.any?
    @donnees = Donnee.where(corporation_id: @corporation.id, annee: @formulaire.annee)
    #if @donnees.nil?
    #  @donnees = Donnee.where("corporation_id = ? AND annee < ?", @corporation.id, @formulaire.annee).order(annee: :desc).first
    #end
  end

  def update
    @corporation = Corporation.find(params[:corporation_id])
    @adherent = @corporation.adherents.find(params[:adherent_id])
    @formulaire = Formulaire.find(params[:id])

    if @formulaire.update(formulaire_params)
      redirect_to root_path, notice: "Formulaire modifié avec succès"
    else
      render :edit
    end
  end

  def set_formulaire
    @formulaire = Formulaire.find(params[:id])
  end

  private

  def formulaire_params
    params.require(:formulaire).permit(:raison_sociale, :nom_prenom, :adresse, :cp_ville, :telephone, :portable, :email, :statut, :forme_juridique, :siret, :nb_salaries, :nb_apprentis, :mode_paiement, :lieu, :date, :titulaire_compte, :adresse_sepa, :cp_ville_sepa, :iban_sepa, :bic_sepa, :lieu_date_sepa, :annee)
  end

end
