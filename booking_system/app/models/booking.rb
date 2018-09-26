class Booking < ApplicationRecord
  belongs_to :room

  validates :description, presence: true, allow_blank: false
end
