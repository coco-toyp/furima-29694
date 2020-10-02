FactoryBot.define do
  factory :good do
    name               {"あ"}
    description        {"あ"}
    category_id        {1}
    condition_id       {1}
    shipping_bill_id   {1}
    shipping_area_id   {1}
    shipping_date_id   {1}
    price              {1000}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end


  end
end
