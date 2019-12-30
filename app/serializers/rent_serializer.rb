class RentSerializer < ActiveModel::Serializer
  attributes :begin_date, :end_date

  belongs_to :user
  belongs_to :book
end
