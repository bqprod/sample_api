FactoryBot.define do
  factory :user, aliases: %i[creator] do
    email { Faker::Internet.email }
  end
end
