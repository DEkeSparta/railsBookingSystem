class Room < ApplicationRecord
  has_many :bookings

  def isFree date, startT, endT
    isFree = true

    self.bookings.each do |b|
      if date == b.date
        if startT.strftime( "%H%M" ) < b.end.strftime( "%H%M" ) && endT.strftime( "%H%M" ) > b.start.strftime( "%H%M" )
          isFree = false
          break
        end
      end
    end

    isFree
  end
end
