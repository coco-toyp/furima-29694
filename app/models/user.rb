class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
   has_many :goods
   has_many :purchases

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         with_options presence: true do
          validates :nickname
          validates :birthday
          validates :email,    uniqueness: {case_sensitive: false},
                               format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, message: 'は.comがないと登録できません'}
          validates :password, length: {minimum: 6} ,format: { with: /\A[a-z]+[0-9]+\z/i, message: 'は半角英数混合で記入してください' }

          with_options format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: 'は全角で入力してください'} do
            validates :first_name
            validates :last_name
          end
       
          with_options format: {with: /\A[ァ-ヶー－]+\z/, message: 'and Last kananame はカタカナで入力してください'} do
            validates :first_kananame
            validates :last_kananame
          end
        end

end
