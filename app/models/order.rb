class Order < ApplicationRecord
  belongs_to :good
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :shipping_area
end
