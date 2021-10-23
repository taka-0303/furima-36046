FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {Faker::Internet.free_email}
    password              {'0000aaaa'}
    password_confirmation {password}
    last_name             {'田中'}
    first_name            {'太郎'}
    last_name_read        {'タナカ'}
    first_name_read       {'タロウ'}
    birth_day             {'1990-01-01'}
  end
end