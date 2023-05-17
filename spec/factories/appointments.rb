# == Schema Information
#
# Table name: appointments
#
#  id             :bigint           not null, primary key
#  recommendation :text
#  active         :boolean          default(TRUE), not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  patient_id     :bigint
#  doctor_id      :bigint
#
FactoryBot.define do
  factory :appointment do
    patient { association :patient }
    doctor { association :doctor }
  end
end
