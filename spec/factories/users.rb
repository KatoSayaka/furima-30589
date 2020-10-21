FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name             {"あいうえお"}
    first_name            {"かきくけこ"}
    last_name_kana        {"アイウエオ"}
    first_name_kana       {"カキクケコ"}
    birthday              {Faker::Date.birthday}        
  end
end