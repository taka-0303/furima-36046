class Item < ApplicationRecord
  
  belongs_to :user
  has_one :purchase
  
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :commission
  belongs_to :area
  belongs_to :delivery

  validates :image,          presence: true
  validates :item_name,      presence: true
  validates :text,           presence: true
  validates :category_id,    presence: true, numericality: { other_than: 1 }
  validates :condition_id,   presence: true, numericality: { other_than: 1 }
  validates :commission_id,  presence: true, numericality: { other_than: 1 }
  validates :area_id,        presence: true, numericality: { other_than: 1 }
  validates :delivery_id,    presence: true, numericality: { other_than: 1 }
  validates :price,          presence: true, inclusion: { in: 300..9_999_999 }, format: { with: /\A[0-9]+\z/ }
end
