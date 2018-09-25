class Room < ApplicationRecord
  has_many :bookings

  def isFree date, startT, endT
    isFree = true

    self.bookings.each do |b|
      if date == b.date.strftime("%Y-%m-%d")
        if startT.to_i < b.end.strftime( "%H%M" ).to_i && endT.to_i > b.start.strftime( "%H%M" ).to_i
          isFree = false
          break
        end
      end
    end

    isFree
  end
end
