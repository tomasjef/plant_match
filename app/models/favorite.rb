class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :plant

  validates :plant_id, presence: true, uniqueness: { scope: :user_id, message: "is already in your garden" } # without the user_id scope the plant would not be able to be added by another user to favorites
end
