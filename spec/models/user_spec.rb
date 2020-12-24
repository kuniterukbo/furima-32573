require 'rails_helper'

describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空では登録できない" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "emailは@を含まないと登録できない" do
        @user.email = "aaabbb"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "passwordが空では登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが5文字以下であれば登録できない" do
        @user.password = 'aaa11'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password = 'aaa111'
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "パスワードは、数字のみでは登録できない" do
        @user.password = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
      end
      it "パスワードは、英字のみでは登録できない" do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
      end
      it "パスワードは、全角では登録できない" do
        @user.password = 'あああ１１１'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
      end
      it "ユーザー本名の名字が空では登録できない" do
        @user.family_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end
      it "ユーザー本名の名前が空では登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "ユーザー本名の名字が半角では登録できない" do
        @user.family_name = "aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name 全角文字を使用してください")
      end
      it "ユーザー本名の名前が半角では登録できない" do
        @user.first_name = "aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name 全角文字を使用してください")
      end
      it "ユーザー本名のフリガナの名字が空だと登録できない" do
        @user.family_name_katakana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name katakana can't be blank")
      end
      it "ユーザー本名のフリガナの名前が空だと登録できない" do
        @user.first_name_katakana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name katakana can't be blank")
      end
      it "ユーザー本名のフリガナの名字は半角では登録できない" do
        @user.family_name_katakana = "aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name katakana 全角カタカナを使用してください")
      end
      it "ユーザー本名のフリガナの名前は半角では登録できない" do
        @user.first_name_katakana = "aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name katakana 全角カタカナを使用してください")
      end
      it "生年月日が空では登録できない" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end

  end
end