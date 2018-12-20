class Attendee < ApplicationRecord
  has_many :items

  validates :name, presence: true
  validates :email, presence: true
  validates :phone_number, presence: true



end ##end of Attendee class
