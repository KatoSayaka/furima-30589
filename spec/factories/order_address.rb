FactoryBot.define do
  factory :order_address do
    postal_code     {"123-4567"}
    prefecture_id   {2}
    city            {"大阪市"}
    address_num     {"梅田1-1-1"}
    building_name   {"駅前ビル"}
    phone           {"33333333333"}
    token           {"tok_abcdefghijk00000000000000000"}
  end
end
