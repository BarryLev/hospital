FactoryBot.define do
  factory :appointment do
    patient { association :patient }
    doctor { association :doctor }
  end
end
