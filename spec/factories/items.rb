FactoryBot.define do
  factory :item do
    item_name {Faker::Lorem.sentence}
    text {Faker::Lorem.sentence}
    category_id {'2'}
    condition_id {'2'}
    commission_id {'2'}
    area_id {'2'}
    delivery_id {'2'}
    price {Faker::Number.between(300,9_999_999)}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
