class FormulairesController < ApplicationController

  #before_action :set_formulaire, only: [:edit, :update]
  def show
    @corporation = Corporation.find(params[:corporation_id])
    @selected_year = session[:selected_year]
    @adherent = Adherent.find(params[:adherent_id])
    @annee = params[:annee]
    @formulaire = @adherent.formulaires.find_by(annee: @annee)
    @donnees = Donnee.where(corporation_id: @corporation.id).where("annee <= ?", @annee).order(annee: :desc).first
    @show_mode = true
    if params[:telecharger]
      html = render_to_string(template: "formulaires/show", formats: [:html])
      grover = Grover.new(html,
                          scale: 0.40,
                          encoding: 'utf8',
                          style_tag_options: [{ path: "app/assets/stylesheets/corporation.css" }],
                          puppeteer: {
                            args: ["--no-sandbox"]
                          })
      pdf = grover.to_pdf
      send_data pdf, filename: "formulaire_#{@annee}.pdf", type: 'application/pdf', disposition: 'inline'
    end
  end

  def new
    @corporation = Corporation.find(params[:corporation_id])
    @adherent = Adherent.find(params[:adherent_id])
    @selected_year = session[:selected_year]
    all_data = @corporation.donnees
    @donnees = all_data.find_by(annee: @selected_year) || all_data.where('annee < ?', @selected_year).order(annee: :desc).first
    @formulaire = Formulaire.new
    @formulaire.annee = @selected_year

  end

  def create
    @corporation = Corporation.find(params[:corporation_id])
    @adherent = Adherent.find(params[:adherent_id])
    @selected_year = session[:selected_year]
    @formulaire.annee = @selected_year
    @formulaire = @adherent.formulaires.build(formulaire_params)
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
    @annee = @formulaire.annee
    @donnees = Donnee.where(corporation_id: @corporation.id).where("annee <= ?", @annee).order(annee: :desc).first
    #if @donnees.nil?
    #  @donnees = Donnee.where("corporation_id = ? AND annee < ?", @corporation.id, @formulaire.annee).order(annee: :desc).first
    #end
  end

  def update
    @corporation = Corporation.find(params[:corporation_id])
    @adherent = @corporation.adherents.find(params[:adherent_id])
    @formulaire = Formulaire.find(params[:id])
    @selected_year = session[:selected_year]
    if @formulaire.update(formulaire_params)
      redirect_to corporation_path(@corporation, selected_year: session[:selected_year]), notice: "Formulaire modifié avec succès"
    else
      render :edit
    end
  end

  def destroy
    @corporation = Corporation.find(params[:corporation_id])
    @adherent = Adherent.find(params[:adherent_id])
    @formulaire = Formulaire.find(params[:id])

    if @formulaire.destroy
      redirect_to corporation_adherent_formulaire_path(@corporation, @adherent), notice: 'Le formulaire a été supprimé avec succès.'
    else
      redirect_to corporation_adherent_formulaire_path(@corporation, @adherent), alert: 'Une erreur est survenue lors de la suppression du formulaire.'
    end
  end

  def set_formulaire
    @formulaire = Formulaire.find(params[:id])
  end

  private

  def formulaire_params
    params.require(:formulaire).permit(:raison_sociale, :nom_prenom, :adresse, :cp_ville, :telephone, :portable, :email, :statut, :forme_juridique, :siret, :nb_salaries, :nb_apprentis, :mode_paiement, :lieu, :date, :titulaire_compte, :adresse_sepa, :cp_ville_sepa, :iban_sepa, :bic_sepa, :lieu_date_sepa, :annee, :checkbox_1, :code_naf_ape,  :checkbox_2,  :checkbox_3, :checkbox_4, :checkbox_5, :champ_1, :champ_2, :champ3)
  end

end

