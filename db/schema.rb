# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_04_22_132149) do
  create_table "adherents", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.string "nom"
    t.string "numero_adherent"
    t.bigint "corporation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["corporation_id"], name: "index_adherents_on_corporation_id"
  end

  create_table "annees", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.integer "annee"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "corporations", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.string "nom"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "donnees", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.integer "annee"
    t.string "nom_formulaire"
    t.string "adresse"
    t.string "banque"
    t.string "iban"
    t.string "bic"
    t.string "pays"
    t.string "nom_creancier"
    t.string "id_creancier"
    t.string "addresse_creancier", limit: 100
    t.string "pays_creancier"
    t.string "type_paiement"
    t.string "montant_parametre_1"
    t.string "montant_parametre_2"
    t.string "montant_parametre_3"
    t.string "montant_parametre_4"
    t.string "montant_parametre_5"
    t.string "montant_parametre_6"
    t.string "montant_parametre_7"
    t.string "montant_parametre_8"
    t.string "montant_parametre_9"
    t.string "texte_parametre_1"
    t.string "texte_parametre_2"
    t.string "texte_parametre_3"
    t.string "texte_parametre_4"
    t.string "texte_parametre_5"
    t.string "texte_parametre_6"
    t.string "texte_parametre_7"
    t.string "texte_parametre_8"
    t.string "texte_parametre_9"
    t.bigint "corporation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["corporation_id"], name: "index_donnees_on_corporations_id"
  end

  create_table "formulaires", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.bigint "adherent_id", null: false
    t.string "raison_sociale"
    t.string "nom_prenom"
    t.string "adresse"
    t.string "cp_ville"
    t.string "telephone"
    t.string "portable"
    t.string "email"
    t.string "statut"
    t.string "forme_juridique"
    t.string "code_naf_ape"
    t.string "siret"
    t.integer "nb_salaries"
    t.integer "nb_apprentis"
    t.string "mode_paiement"
    t.string "lieu"
    t.date "date"
    t.string "titulaire_compte"
    t.string "adresse_sepa"
    t.string "cp_ville_sepa"
    t.string "iban_sepa"
    t.string "bic_sepa"
    t.string "lieu_date_sepa"
    t.boolean "checkbox_1"
    t.string "checkbox_2"
    t.string "checkbox_3"
    t.string "checkbox_4"
    t.string "checkbox_5"
    t.string "checkbox_6"
    t.string "checkbox_7"
    t.string "checkbox_8"
    t.string "checkbox_9"
    t.string "champ_1"
    t.string "champ_2"
    t.string "champ_3"
    t.string "champ_4"
    t.string "champ_5"
    t.string "champ_6"
    t.string "champ_7"
    t.string "champ_8"
    t.string "champ_9"
    t.string "annee"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["adherent_id"], name: "index_formulaires_on_adherent_id"
  end

  add_foreign_key "adherents", "corporations"
  add_foreign_key "donnees", "corporations"
  add_foreign_key "formulaires", "adherents"
end
