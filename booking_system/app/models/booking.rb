class Booking < ApplicationRecord
  belongs_to :room

  validates :description, presence: true, allow_blank: false
  validate :start_must_be_before_end_time

  def start_must_be_before_end_time
    errors.add(:start, "must be before end time") unless
      self.start.strftime("%H%M") < self.end.strftime("%H%M")
  end

  

end
