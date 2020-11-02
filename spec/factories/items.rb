FactoryBot.define do
  factory :item do
    item_name           {Faker::Name.name}
    item_info           {Faker::Lorem.sentence}
    category_id         {3}
    item_state_id       {3}
    shipping_fee_id     {3}
    prefecture_id       {3}
    shipping_day_id     {3}
    price               {7777}    
    association :user      

    after(:build) do |item|
      item.item_image.attach(io: File.open('public/test_image.png'), filename: 'test_image.png')
    end
  end
end
