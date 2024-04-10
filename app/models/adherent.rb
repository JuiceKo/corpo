class Adherent < ApplicationRecord
  belongs_to :corporation
  has_many :formulaires


  # RANSACK (SEARCHBAR)
  ransacker :numero_adherent_string do
    Arel.sql("to_char(\"#{table_name}\".\"numero_adherent\", '9999999')")
  end

  def self.ransackable_associations(auth_object = nil)
    super
  end

  def self.ransackable_attributes(auth_object = nil)
    %w[corporation_id created_at id id_value nom numero_adherent updated_at]
  end

end
