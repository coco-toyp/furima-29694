FactoryBot.define do
  factory :good do
    name               {"あ"}
    description        {"あ"}
    category_id        {2}
    condition_id       {2}
    shipping_bill_id   {2}
    shipping_area_id   {2}
    shipping_date_id   {2}
    price              {1000}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end


  end
end
