class AdherentsController < ApplicationController
  def new_avec_adherent
    @corporation = Corporation.find(params[:corporation_id])
    @adherent = Adherent.new(corporation: @corporation)
    @formulaire = @adherent.formulaires.build
    all_data = @corporation.donnees
    @max_year_data = all_data.order(annee: :desc).first if all_data.any?
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

  def download_pdf
    @corporation = Corporation.find(params[:corporation_id])
    @adherent = Adherent.find(params[:adherent_id])
    year = params[:year]
    @formulaire = @adherent.formulaires.find_by(annee: year)
    if @formulaire
      pdf = generate_pdf_for_adherent(@adherent, year)
      send_data pdf, filename: "formulaire_#{year}_#{adherent.id}.pdf", type: "application/pdf"
    else
      redirect_to corporation_path(@corporation), alert: 'No formulaire found for the selected year.'
    end
  end

  def generate_pdf_for_adherent(adherent, year)
    html = render_to_string(template: "adherents/_pdf", formats: [:html], locals: { adherent: adherent, year: year })
    grover = Grover.new(html, scale: 0.6)
    grover.to_pdf
  end

  private

  def adherent_params
    params.require(:adherent).permit(:nom)
  end

  def formulaire_params
    params.require(:formulaire).permit(:raison_sociale, :nom_prenom, :adresse, :cp_ville, :telephone, :portable, :email, :statut, :forme_juridique, :siret, :nb_salaries, :nb_apprentis, :mode_paiement, :lieu, :date, :titulaire_compte, :adresse_sepa, :cp_ville_sepa, :iban_sepa, :bic_sepa, :lieu_date_sepa, :annee)
  end

end
