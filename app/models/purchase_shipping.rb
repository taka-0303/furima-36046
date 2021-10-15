class PurchaseShipping
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area

  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :area_id, :municipalities, :address, :cuilding, :telephone_number, :purchase_id

  validates :user_id, purchase: true
  validates :item_id, purchase: true
  validates :postal_code,      presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :area_id,          presence: true, numericality: { other_than: 1 }
  validates :municipalities,   presence: true
  validates :address,          presence: true
  validates :telephone_number, presence: true

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)

    ShippingInfo.create(postal_code: postal_code, area_id: area_id, municipalities: municipalities, address: address, building_name: building_name, telephone_number: telephone_number, purchase_id: purchase.id)
  end
end