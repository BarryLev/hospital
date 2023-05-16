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
class Patient < User
  has_many :appointments, class_name: Appointment.name, foreign_key: :patient_id
  has_many :doctors, class_name: Doctor.name, through: :appointments
end
