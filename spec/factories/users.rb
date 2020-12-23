FactoryBot.define do
  factory :user do
    nickname {Faker::Name.name}
    email {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
    family_name {"あああ"}
    first_name {"いいい" }
    family_name_katakana {"アアア"}
    first_name_katakana {"イイイ" }
    birthday {Faker::Date.in_date_period}
  end
end