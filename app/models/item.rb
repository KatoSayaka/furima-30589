class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category_id
  belongs_to_active_hash :item_state_id
  belongs_to_active_hash :shipping_fee_id
  belongs_to_active_hash :prefecture_id
  belongs_to_active_hash :shipping_day_id

  belongs_to :user
  has_one :order
  has_one_attached :item_image
  
  with_options presence: true do
    validates :item_name
    validates :item_info
    validates :category_id
    validates :item_state_id 
    validates :prefecture_id 
    validates :shipping_day_id
    validates :price
  end
end
  
