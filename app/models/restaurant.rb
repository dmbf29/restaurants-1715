class Restaurant < ApplicationRecord
  # associations -> has_many / belongs_to
  # if you destroy the restaurant, it also destroys the reviews with it
  has_many :reviews, dependent: :destroy # restaurant.reviews
  # validations
  validates :name, presence: true
  validates :address, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
