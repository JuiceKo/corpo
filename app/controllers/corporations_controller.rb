class CorporationsController < ApplicationController
  require 'csv'

  def index
    @corporations = Corporation.all
    @corporations = Corporation.includes(:donnees)
    @annees = Annee.all
    @latest_donnees = {}
    @corporations.each do |corporation|
      @latest_donnees[corporation.id] = corporation.donnees.order(annee: :desc).first
    end
    @corporations = Corporation.includes(:adherents)
  end

  def show
    @corporation = Corporation.find(params[:id])
    @q = @corporation.adherents.ransack(params[:q])
    @selected_year = params[:selected_year] || Time.now.year
    session[:selected_year] = @selected_year

    if params[:show_all_adherents] == "1"
      @adherents = @q.result(distinct: true).includes(:formulaires)
    else
      @adherents = @q.result(distinct: true).includes(:formulaires).select do |adherent|
        adherent.formulaires.any? { |formulaire| formulaire.annee == @selected_year }
      end
    end

    @adherent_years = {}
    @adherents.each do |adherent|
      @adherent_years[adherent.id] = adherent.formulaires.pluck(:annee).uniq.sort.reverse
    end
  end


  def edit
    @corporation = Corporation.find(params[:id])
    @selected_year = params[:selected_year] || Time.now.year
    session[:selected_year] = @selected_year
    @donnees = @corporation.donnees.where(annee: params[:selected_year])
  end

  def select_year
    selected_year = params[:selected_year]
    session[:selected_year] = selected_year
    redirect_back fallback_location: corporations_path
  end

  def update
    @corporation = Corporation.find(params[:id])
    if @corporation.update(corporation_params)
      redirect_to root_path, notice: 'Corporation mise à jour avec succès.'
    else
      flash.now[:alert] = 'Erreur lors de la mise à jour de la corporation.'
      render :edit
    end
  end

  def nettoyer_chaine(chaine)
    return chaine if chaine.nil?
    chaine.gsub!(/\p{Cntrl}/, '')
    chaine.strip!
    chaine
  end

  def import
    file = params[:file].tempfile
    options = { headers: true, col_sep: ';' }

    CSV.foreach(file, **options) do |row|
      user_hash = {}
      user_hash[:nom_prenom] = row['Nom']
      user_hash[:email] = row['E-mail']
      user_hash[:raison_sociale] = row['Raison Sociale']
      user_hash[:adresse] = row['Adresse']
      user_hash[:cp_ville] = "#{row['Code Postal']} #{row['Commune']}"
      user_hash[:portable] = row['Numéro Téléphone Portable']
      user_hash[:telephone] = row['Numéro Téléphone']
      user_hash[:siret] = row['N° SIRET']
      user_hash[:annee] = row['année']
      user_hash[:forme_juridique] = row ['Forme Juridique']

      existing_adherent = Adherent.find_by(nom: row['Nom'], corporation_id: row['Corporation'])

      if existing_adherent
        formulaire = Formulaire.new(user_hash.merge(adherent_id: existing_adherent.id))
        existing_formulaire = existing_adherent.formulaires.where(annee: row['année'])
        if existing_formulaire.empty?
          if formulaire.save
            puts "Formulaire sauvegardé avec succès pour l'adhérent existant : #{existing_adherent.id}"
          else
            puts "Erreur lors de la sauvegarde du formulaire pour l'adhérent existant"
          end
        else
          puts "Le formulaire pour l'adhérent existant existe déjà"
        end

      else
        puts "Aucun adhérent avec le même nom et la même corporation n'existe pas"
        nouvel_adherent = Adherent.new(nom: row['Nom'], corporation_id: row['Corporation'])

        if nouvel_adherent.save
          puts "Nouvel adhérent créé avec succès : #{nouvel_adherent.id}"
          formulaire = Formulaire.new(user_hash.merge(adherent_id: nouvel_adherent.id))

          if formulaire.save
            puts "Formulaire sauvegardé avec succès pour le nouvel adhérent : #{nouvel_adherent.id}"
          else
            puts "Erreur lors de la sauvegarde du formulaire pour le nouvel adhérent"
          end
        else
          puts "Erreur lors de la création du nouvel adhérent"
        end
      end
    end
    redirect_to root_path, notice: "Les données ont été importées avec succès."
  end


  private

  def corporation_params
    params.require(:corporation).permit(:nom)
  end

end