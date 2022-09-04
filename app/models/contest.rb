class Contest < ApplicationRecord
  validates :name, :description, :platform, :registration, :timings, presence: true
end
