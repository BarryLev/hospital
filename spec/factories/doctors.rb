FactoryBot.define do
  factory :doctor do
    name { Faker::Name.name }
    phone { Faker::Number.leading_zero_number(digits: 10) }
    password { Faker::Internet.password }
    category { association :category }

    trait :invalid_number do
      phone { "1#{Faker::Number.number(digits: 9)}" }
    end

    trait :short_number do
      phone { Faker::Number.leading_zero_number(digits: 9) }
    end
  end
end
