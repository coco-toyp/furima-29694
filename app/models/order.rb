class Order < ApplicationRecord
  attr_accessor :token
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :shipping_area
  belongs_to :good
  belongs_to :purchase
end
