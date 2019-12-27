class Rent < ApplicationRecord
  validates :user, :book, :begin_date, :end_date, presence: true
  validate :begin_date_greater_than_end_date

  belongs_to :user
  belongs_to :book

  private

  def begin_date_greater_than_end_date
    errors.add(:begin_date, 'begin_date cannot be greater than end_date') if begin_date > end_date
  end
end
