class Item < ApplicationRecord
  belongs_to :attendee

    validates :name, presence: true
    validates :cost, numericality: { only_integer: true }

  def attendee_name
    @attendee_name = Attendee.find(self.attendee_id).name
  end
end ##end of item class
