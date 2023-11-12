FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    first_name            {'あああ'}
    last_name             {'いいい'}
    first_kana            {'アアア'}
    last_kana             {'イイイ'}
    birthdate             {Date.today}
    email                 {Faker::Internet.email}
    password    {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
  end
end