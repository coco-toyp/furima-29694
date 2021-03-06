class Good < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :purchase
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_bill
  belongs_to_active_hash :shipping_area
  belongs_to_active_hash :shipping_date

  with_options presence: true do
    validates :image
    validates :name
    validates :description
    with_options numericality: { other_than: 1 }  do
      validates :category_id
      validates :condition_id
      validates :shipping_bill_id
      validates :shipping_area_id
      validates :shipping_date_id
    end
    validates :user
    validates :price, format: {with: /\A[0-9]+\z/, message: "は半角数字で入力してください" }, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 99_999_999 }
    


  
  end
  
end
