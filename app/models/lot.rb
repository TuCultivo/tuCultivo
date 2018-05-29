class Lot < ApplicationRecord
  belongs_to :farm
  #has_many :groofe, dependent: :destroy
  validates :name, presence: true
  has_many :grooves, class_name: 'Groove'
end
