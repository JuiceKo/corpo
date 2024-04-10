class AddForeignKeyToAdherents < ActiveRecord::Migration[7.1]
  def change
    def change
      add_reference :adherents, :corporations, foreign_key: true
    end
  end
end
