FactoryBot.define do
  factory :post do
    creator
    title { Faker::Lorem.sentence }
    body { Faker::Lorem.paragraph }
  end
end
