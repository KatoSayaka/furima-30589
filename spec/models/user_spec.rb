require 'rails_helper'
RSpec.describe User, type: :model do
  before do  
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nicknameとemail、passwordとpassword_confirmation、姓名と姓名の読み、生年月日が存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it "ユーザー本名は、全角（漢字・ひらがな・カタカナ）なら登録できる" do
        @user.last_name = "亜あア"
        @user.first_name = "亜あア"
        expect(@user).to be_valid
      end
      it "ユーザー本名のフリガナは、全角（カタカナ）なら登録できる" do
        @user.last_name_kana = "アーン"
        @user.first_name_kana = "アーン"
        expect(@user).to be_valid
      end
      it "パスワードは、半角英数字混合なら登録できる" do
        @user.password = "passw0rd12"
        @user.password_confirmation = "passw0rd12"
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end
      it "emailが空だと登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
      it "emailに@が含まれていないと登録できない" do
        @user.email = "abcdef"
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールは不正な値です")
      end
      it "重複したemailが存在する場合は登録できない" do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Eメールはすでに存在します")
      end
      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it "passwordは英数字混合だが、5文字以下だと登録できない" do
        @user.password = "app1e"
        @user.password_confirmation = "app1e"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end  
      it "苗字が空だと登録できない" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字を入力してください") 
      end
      it "名前が空だと登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("名前を入力してください")
      end
      it "苗字の読みが空だと登録できない" do
        @user.last_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字のカナを入力してください") 
      end
      it "名前の読みが空だと登録できない" do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("名前のカナを入力してください")
      end
      it "ユーザー本名は、全角（漢字・ひらがな・カタカナ）でなければ登録できない" do
        @user.last_name = "abc123"
        @user.first_name = "def456"
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字全角文字を使用してください", "名前全角文字を使用してください")
      end
      it "ユーザー本名のフリガナは、全角（カタカナ）でなければ登録できない" do
        @user.last_name_kana = "aあ亜"
        @user.first_name_kana = "bい衣"
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字のカナ全角カタカナを使用してください", "名前のカナ全角カタカナを使用してください")
      end
      it "生年月日が空だと登録できない" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("生年月日を入力してください")
      end
    end
  end
end
