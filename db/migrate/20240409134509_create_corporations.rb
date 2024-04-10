class CreateCorporations < ActiveRecord::Migration[7.1]
  def change
    create_table :corporations do |t|
      t.string :nom

      t.timestamps
    end
  end
end
