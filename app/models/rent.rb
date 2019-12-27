class Rent < ApplicationRecord
  validates :user, :book, :begin, :end, presence: true
  validate :begin_greater_than_end, :end_less_than_begin

  belongs_to :user, :book

  def begin_greater_than_end
    errors.add(:begin, 'begin date cannot be greater than end date') if :begin > :end
  end

  def end_less_than_begin
    errors.add(:end, 'end date cannot be less than begin date') if :end < :begin
  end
end
