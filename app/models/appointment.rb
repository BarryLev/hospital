# == Schema Information
#
# Table name: appointments
#
#  id             :bigint           not null, primary key
#  recommendation :text
#  active         :boolean
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  user_id        :bigint
#  doctor_id      :bigint
#
class Appointment < ApplicationRecord
  belongs_to :patient, class_name: Patient.name, foreign_key: :patient_id
  belongs_to :doctor, class_name: Doctor.name, foreign_key: :doctor_id

  validates_presence_of :active
end
