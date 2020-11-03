class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address_num, :building_name, :phone, :item_id, :token, :user_id

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "は半角数字を使用してください ハイフンを含めてください"}
    validates :city, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "は全角文字を使用してください"}
    validates :address_num
    validates :phone, format: {with: /\A\d{10}\z|\A\d{11}\z/ , message: "は11桁以内の半角数字を使用してください ハイフンは含めないでください"}
    validates :token
  end

    validates :prefecture_id, numericality: { other_than: 1, message: "を入力してください"}
              
                 
    def save
      order = Order.create(user_id: user_id, item_id: item_id)
      Address.create(postal_code: postal_code,  prefecture_id: prefecture_id, city: city, address_num: address_num, building_name: building_name, phone: phone, order_id: order.id)
    end
end

