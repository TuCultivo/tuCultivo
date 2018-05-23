class PlagueReport < ApplicationRecord
  belongs_to :groove
  has_many :sick_plants, dependent: :destroy
end
