class SickPlant < ApplicationRecord
  belongs_to :plague_report
  validates :location, presence: true
end
