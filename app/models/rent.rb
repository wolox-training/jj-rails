class Rent < ApplicationRecord
  validates :user, :book, :begin, :end, presence: true
  belongs_to :user, :book
end
