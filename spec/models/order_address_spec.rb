require 'rails_helper'
RSpec.describe OrderAddress, type: :model do
    before do
      @order_address = FactoryBot.build(:order_address)
    end
 
    describe "商品購入・住所情報の保存" do
      it "クレジットカード情報、郵便番号、都道府県、市区町村、番地、電話番号が正しく入力されていれば保存できる" do
        expect(@order_address).to be_valid
      end

      it "建物名が空でも保存できる" do
        @order_address.building_name = nil
        expect(@order_address).to be_valid
      end

      it "tokenが空では登録できないこと" do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("クレジットカード情報を入力してください")
      end

      it "郵便番号が空では登録できないこと" do
        @order_address.postal_code = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("郵便番号を入力してください")
     end
    
      it "郵便番号が全角（漢字・ひらがな・カタカタ）、ハイフンを含んでいない場合保存できない" do
        @order_address.postal_code = "あいウ１２３"  
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("郵便番号は半角数字を使用してください ハイフンを含めてください")
      end
    
      it '都道府県は、"---"以外が選択されていないと登録できない' do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("都道府県を入力してください")
      end
    
      it "市区町村が空では登録できないこと" do
        @order_address.city = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("市区町村を入力してください")
      end

      it "市区町村は半角英数だと保存できない" do
        @order_address.city = "abc123"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("市区町村は全角文字を使用してください")
      end
 
      it "番地が空だと登録できないこと" do
        @order_address.address_num = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("番地を入力してください")
      end

      it "電話番号は空だと保存できない" do
        @order_address.phone = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("電話番号を入力してください")
      end

      it "電話番号は全角（漢字・ひらがな・カタカタ）、ハイフンがあると保存できない" do
        @order_address.phone = "あいウ-１２３"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("電話番号は11桁以内の半角数字を使用してください ハイフンは含めないでください")
      end

      it "電話番号は11桁以内でないと登録できないこと" do
        @order_address.phone = "123451234512"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("電話番号は11桁以内の半角数字を使用してください ハイフンは含めないでください")
      end
    end
end

