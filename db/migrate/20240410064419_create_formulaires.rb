class CreateFormulaires < ActiveRecord::Migration[7.1]
  def change
    create_table :formulaires do |t|
      t.string :raison_sociale
      t.string :nom_prenom
      t.string :adresse
      t.string :cp_ville
      t.string :telephone
      t.string :portable
      t.string :email
      t.string :statut
      t.string :forme_juridique
      t.string :code_naf_ape
      t.string :siret
      t.integer :nb_salaries
      t.integer :nb_apprentis
      t.string :mode_paiement
      t.string :lieu
      t.date :date
      t.string :titulaire_compte
      t.string :adresse_sepa
      t.string :cp_ville_sepa
      t.string :iban_sepa
      t.string :bic_sepa
      t.string :lieu_date_sepa
      t.string :checkbox_1
      t.string :checkbox_2
      t.string :checkbox_3
      t.string :checkbox_4
      t.string :checkbox_5
      t.string :checkbox_6
      t.string :checkbox_7
      t.string :checkbox_8
      t.string :checkbox_9
      t.string :champ_1
      t.string :champ_2
      t.string :champ_3
      t.string :champ_4
      t.string :champ_5
      t.string :champ_6
      t.string :champ_7
      t.string :champ_8
      t.string :champ_9
      t.string :annee
      t.references :corporation, foreign_key: true


      t.timestamps
    end
  end
end
