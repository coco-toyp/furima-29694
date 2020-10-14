class PurchaseOrder
  include ActiveModel::Model
  attr_accessor :token, :postal, :shipping_area_id, :city, :address, :call, :building, :purchase_id, :user_id, :good_id

  with_options presence: true do
    validates :city
    validates :address
    validates :call
    validates :postal, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :shipping_area_id, numericality: { other_than: 1, message: "can't be blank" }
  end

  def save
    
    purchase = Purchase.create(good_id: good_id, user_id: user_id)
    Order.create(postal: postal, shipping_area_id: shipping_area_id, city: city, address: address, call: call, building: building, purchase_id: purchase.id)
  end
  
end