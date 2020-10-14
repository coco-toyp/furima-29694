FactoryBot.define do
  factory :purchase_order do
    postal { '123-4567' }
    shipping_area_id { 2 }
    city { '東京都' }
    address { '1-1' }
    building { '東京ハイツ' }
    call { "08067651112" }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
