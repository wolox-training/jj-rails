class Rent < ApplicationRecord
  validates :user, :book, :begin_date, :end_date, presence: true
  validate :begin_date_greater_than_end_date, if: -> { begin_date.present? && end_date.present? }

  belongs_to :user
  belongs_to :book

  private

  def begin_date_greater_than_end_date
    message = 'begin_date cannot be greater than end_date'
    errors.add(:begin_date, message) if begin_date.at_midnight > end_date.at_midnight
  end
end
