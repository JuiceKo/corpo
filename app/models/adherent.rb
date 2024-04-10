class Adherent < ApplicationRecord
  belongs_to :corporation
  has_many :formulaires
end
