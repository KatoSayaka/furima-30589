require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @user = FactoryBot.build(:user)
    @item = FactoryBot.build(:item)
  end

  describe "商品出品登録" do 
    context "商品出品がうまくいくとき" do
      it "商品画像、商品名、商品説明が存在していれば登録できる" do
        expect(@item).to be_valid
      end
    end

    context "商品出品がうまくいかないとき" do 
      it "ユーザーが紐付いていないと商品出品はできない" do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
      it "商品画像が空だと登録できない" do
        @item.item_image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Item image can't be blank")
      end

      it "商品名が空だと登録できない" do
        @item.item_name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
 
      it "商品説明がないと登録できない" do
        @item.item_info = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Item info can't be blank")
      end

      it 'カテゴリーは"---"以外が選択されていないと登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
    
      it '商品状態は、"---"以外が選択されていないと場合登録できない' do
        @item.item_state_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Item state must be other than 1")
      end

      it '配送料の負担は、"---"以外が選択されていないと場合登録できない' do
        @item.shipping_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee must be other than 1")
      end

      it '発送元の地域は、"---"以外が選択されていないと登録できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
      end

      it '発送日は、"---"以外が選択されていないと登録できない' do
        @item.shipping_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day must be other than 1")
      end
    
      it "販売価格は半角数字でないと登録できない" do
        @item.price = "１０００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it "販売価格は300円以上でないと登録できない" do
        @item.price = 30
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end

      it "販売価格は9999999円以下でないと登録できない" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
    end
  end
end

