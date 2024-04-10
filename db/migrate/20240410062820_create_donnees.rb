class CreateDonnees < ActiveRecord::Migration[7.1]
  def change
    create_table :donnees do |t|
      t.integer :annee
      t.string :nom_formulaire
      t.string :adresse
      t.string :banque
      t.string :iban
      t.string :bic
      t.string :pays
      t.string :nom_creancier
      t.string :id_creancier
      t.string :pays_creancier
      t.string :type_paiement
      t.string :montant_parametre_1
      t.string :montant_parametre_2
      t.string :montant_parametre_3
      t.string :montant_parametre_4
      t.string :montant_parametre_5
      t.string :montant_parametre_6
      t.string :montant_parametre_7
      t.string :montant_parametre_8
      t.string :montant_parametre_9
      t.string :texte_parametre_1
      t.string :texte_parametre_2
      t.string :texte_parametre_3
      t.string :texte_parametre_4
      t.string :texte_parametre_5
      t.string :texte_parametre_6
      t.string :texte_parametre_7
      t.string :texte_parametre_8
      t.string :texte_parametre_9
      t.references :corporations, foreign_key: true

      t.timestamps
    end
  end
end
