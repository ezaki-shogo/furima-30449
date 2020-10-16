FactoryBot.define do
  factory :user do
    nickname {Faker::Name.initials(number: 2)}
    email  {Faker::Internet.free_email}
    password = "1a#{Faker::Internet.password(min_length: 6)}"
    password  {password}
    password_confirmation {password}
    birthday {Faker::Date.birthday(min_age: 18, max_age: 65)}
    full_first_name  {"漢字"}
    full_last_name   {"頭"}
    half_first_name  {"カタカナ"}
    half_last_name   {"カナ"}
  end
end