class Rent < ApplicationRecord
  validates :begin, :end, presence: true
  belongs_to :user, :book
end
