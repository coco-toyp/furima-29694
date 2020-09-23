require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nicknameとemail、passwordとpassword_confirmation、first_nameとlast_name、first_kananameとlast_kananame、birthdayが存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it "passwordが6文字以上で英数混合であれば登録できる" do
        @user.password = "kkk000"
        @user.password_confirmation = "kkk000"
        expect(@user).to be_valid
      end
      it "first_kananameが全角カタカナで登録できる" do
        @user.first_kananame = "ヤマダ"
        expect(@user).to be_valid
      end
      it "last_kananameが全角カタカナで登録できる" do
        @user.last_kananame = "ユウト"
        expect(@user).to be_valid
      end
    end

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
      it "passwordが空では登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが5文字以下であれば登録できない" do
        @user.password = "k0k0k"
        @user.password_confirmation = "k0k0k"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "emailに@がないと登録できない" do
        @user.email = "coco"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "first_nameが空では登録できない" do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "last_nameが空では登録できない" do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it "first_kananameが空では登録できない" do
        @user.first_kananame = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First kananame can't be blank")
      end
      it "last_kananameが空では登録できない" do
        @user.last_kananame = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last kananame can't be blank")
      end
      it "first_kananameはカタカナでなければ登録できない" do
        @user.first_kananame = "ふみと"
        @user.valid?
        expect(@user.errors.full_messages).to include("First kananame and Last kananame はカタカナで入力してください")
      end
      it "last_kananameはカタカナでなければ登録できない" do
        @user.first_kananame = "ふみと"
        @user.valid?
        expect(@user.errors.full_messages).to include("First kananame and Last kananame はカタカナで入力してください")
      end
      it "birthdayが空では登録できない" do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end