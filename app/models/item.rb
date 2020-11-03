class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :item_state
  belongs_to_active_hash :shipping_fee
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping_day

  belongs_to :user
  has_one :order
  has_one_attached :item_image
  
  with_options presence: true do
    validates :item_image
    validates :item_name
    validates :item_info
  end

  with_options numericality: { other_than: 1, message: "を入力してください" } do
    validates :category_id
    validates :item_state_id
    validates :prefecture_id
    validates :shipping_fee_id
    validates :shipping_day_id
  end

  validates :price, format: { with: /\A[0-9]+\z/}, 
             numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}

end
