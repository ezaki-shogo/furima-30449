require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
    @another_user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまく行くとき' do
      it 'nickname、email、password、password_confirmation、birthday、full_first_name、full_last_name、half_first_name、half_last_nameが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'emailに@が存在すること' do
        @user.email = 'aaa@gmail.com'
        expect(@user).to be_valid
      end
      it 'passwordは確認を含めて2回入力すること' do
        @user.password = 'aaaa111'
        @user.password_confirmation = 'aaaa111'
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空だと登録できない' do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '重複したemailが存在すると登録できない' do
        @another_user.save
        @user.email = @another_user.email
        @user.valid?
        expect(@user.errors.full_messages).to include('Email has already been taken')
      end
      it 'passwordが空だと登録できない' do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下でも登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)', 'Password is invalid')
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password = '000000'
        @user.password_confirmation = nil
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'full_first_nameが空だと登録できない' do
        @user.full_first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Full first name can't be blank", 'Full first name is invalid')
      end
      it 'full_last_nameが空だと登録できない' do
        @user.full_last_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Full last name can't be blank", 'Full last name is invalid')
      end
      it 'half_first_nameが空だと登録できない' do
        @user.half_first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Half first name can't be blank", 'Half first name is invalid')
      end
      it 'half_last_nameが空だと登録できない' do
        @user.half_last_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Half last name can't be blank", 'Half last name is invalid')
      end
      it 'birthdayが存在しないと登録できない' do
        @user.birthday = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
      it 'full_first_nameが全角（漢字、ひらがな、カタカナ）での入力でなければ登録できない' do
        @user.full_first_name = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Full first name is invalid')
      end
      it 'full_last_nameが全角（漢字、ひらがな、カタカナ）での入力でなければ登録できない' do
        @user.full_last_name = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Full last name is invalid')
      end
      it 'half_first_nameが全角（カタカナ）での入力でなければ登録できない' do
        @user.half_first_name = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Half first name is invalid')
      end
      it 'half_last_nameが全角（カタカナ）での入力でなければ登録できない' do
        @user.half_last_name = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Half last name is invalid')
      end
    end
  end
end
