class CreateAdherents < ActiveRecord::Migration[7.1]
  def change
    create_table :adherents do |t|
      t.string :nom
      t.integer :numero_adherent
      t.references :corporation, foreign_key: true

      t.timestamps
    end
  end
end
