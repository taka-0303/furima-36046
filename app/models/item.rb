class Item < ApplicationRecord
  belongs_to :user
  
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :commission
  belongs_to :area
  belongs_to :delivery

  validates :item_name, :string, null: false 
  validates :text, :text, null: false
  validates :category_id, :integer, null: false, numericality: { other_than: 1 }
  validates :condition_id, :integer, null: false, numericality: { other_than: 1 }
  validates :commission_id, :integer, null: false, numericality: { other_than: 1 }
  validates :area_id, :integer, null: false, numericality: { other_than: 1 }
  validates :delivery_id, :integer, null: false, numericality: { other_than: 1 }
  validates :price, :integer, null: false
  validates :user_id, presence: true
end
