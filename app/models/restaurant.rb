class Restaurant < ApplicationRecord
  # associations -> has_many / belongs_to
  # validations
  validates :name, presence: true
end
