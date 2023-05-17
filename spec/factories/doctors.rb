# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  phone                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  name                   :string           default("t")
#  role                   :string           default("Patient")
#  category_id            :bigint
#
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
