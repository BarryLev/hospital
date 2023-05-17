FactoryBot.define do
  factory :patient do
    name { Faker::Name.name }
    phone { Faker::Number.leading_zero_number(digits: 10) }
    password { Faker::Internet.password }
  end
end
