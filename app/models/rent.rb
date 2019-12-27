class Rent < ApplicationRecord
  validates :user, :book, :begin, :end, presence: true
  validate :begin_greater_than_end, :end_less_than_begin
  
  belongs_to :user, :book
  
  def begin_greater_than_end
    if begin > end
      errors.add(:begin, "begin date cannot be greater than end date")
    end
  end

  def end_less_than_begin
    if end < begin
      errors.add(:end, "end date cannot be less than begin date")
    end
  end
end
