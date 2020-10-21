class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :purchases  
         
  with_options presence: true do
    validates :email
    validates :birthday

    with_options format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: '全角文字を使用してください' } do
      validates :last_name
      validates :first_name
    end

    with_options format: { with: /\A([ァ-ン]|ー)+\z/, message: '全角カタカナを使用してください' } do
      validates :last_name_kana
      validates :first_name_kana 
    end
  end
  
  validates :nickname, presence: true, length: { maximum: 40 }

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :password, presence: true,
            format: { with: (/\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i), message: '英字と数字の両方を含めて設定してください'}
          
end