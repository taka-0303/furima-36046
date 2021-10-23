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

  with_options presence: true do
    validates :image          
    validates :item_name     
    validates :text         
    validates :category_id,    numericality: { other_than: 1 }
    validates :condition_id,   numericality: { other_than: 1 }
    validates :commission_id,  numericality: { other_than: 1 }
    validates :area_id,        numericality: { other_than: 1 }
    validates :delivery_id,    numericality: { other_than: 1 }
    validates :price,          inclusion: { in: 300..9_999_999 }, format: { with: /\A[0-9]+\z/ }
  end
end
