class PurchaseShipping
  

  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :area_id, :municipalities, :address, :building_name, :cuilding, :telephone_number

  validates :user_id, presence: true
  validates :item_id, presence: true
  validates :postal_code,      presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :area_id,          presence: true, numericality: { other_than: 1 }
  validates :municipalities,   presence: true
  validates :address,          presence: true
  validates :telephone_number, presence: true, format: {with: /\A(\d{10})|(\d{11})\z/, message: "is invalid. Do not include hyphens (-)"}

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)

    ShippingInfo.create(postal_code: postal_code, area_id: area_id, municipalities: municipalities, address: address, building_name: building_name, telephone_number: telephone_number, purchase_id: purchase.id)
  end
end