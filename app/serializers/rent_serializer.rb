class RentSerializer < ActiveModel::Serializer
  attributes :id, :begin_date, :end_date

  belongs_to :book
end
