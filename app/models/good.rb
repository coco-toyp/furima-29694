class Good < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :description
    validates :category_id
    validates :condition_id
    validates :shipping_bill_id
    validates :shipping_area_id
    validates :shipping_date_id
    validates :user
    validates :price, format: {with: /\A[0-9]+\z/, message: "は半角数字で入力してください" ,}

    def was_attached?
      self.image.attached?
    end
  end
  
end
