class Corporation < ApplicationRecord
  has_many :adherents
  has_many :donnees
end
