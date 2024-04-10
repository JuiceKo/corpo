class AddAdherentIdToFormulaire < ActiveRecord::Migration[7.1]
  def change
    add_reference :formulaires, :adherent, null: false, foreign_key: true
  end
end
