class ShippingInfo < ApplicationRecord
  belongs_to :purchase

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area

  validates :postal_code,      presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :area_id,          presence: true, numericality: { other_than: 1 }
  validates :municipalities,   presence: true
  validates :address,          presence: true
  validates :telephone_number, presence: true
end
