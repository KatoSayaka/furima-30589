class Item < ApplicationRecord
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
  
