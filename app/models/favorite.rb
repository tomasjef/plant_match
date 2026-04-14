class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :plant

  validates :plant_id, presence: true, uniqueness: true
end
