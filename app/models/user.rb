class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         with_options presence: true do
          validates :nickname
          validates :birthday
          validates :email,    uniqueness: {case_sensitive: false},
                               format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, message: '＠を含む必要有り'}
          validates :password, length: {minimum: 6, message: 'パスワードは6文字以上'}
       
          with_options format: {with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/, message: '全角文字を使用してください'} do
            validates :first_name
            validates :last_name
          end
       
          with_options format: {with: /\A[ァ-ヶー－]+\z/, message: 'カタカナで入力してください'} do
            validates :first_kananame
            validates :last_kananame
          end
        end
end
