FactoryBot.define do
  factory :purchase_shipping do
    token {"tok_abcdefghijk00000000000000000"}
    postal_code {'123-4567'}
    area_id {'2'}
    municipalities {'横浜市'}
    address {'横浜中華街1-1'}
    building_name {'セキスイハイム111'}
    telephone_number {'09012345678'}
    association :item
  end
end
