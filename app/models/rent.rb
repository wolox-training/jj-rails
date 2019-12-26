class Rent < ApplicationRecord
  validates :begin, :end, :user, :book, presence: true
  belongs_to :user, :book
end
