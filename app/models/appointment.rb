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
class Appointment < ApplicationRecord
  belongs_to :patient, class_name: Patient.name, foreign_key: :patient_id
  belongs_to :doctor, class_name: Doctor.name, foreign_key: :doctor_id

  validates_presence_of :active

  before_update :change_active

  private

  def change_active
    self.active = false if recommendation.present?
  end
end
