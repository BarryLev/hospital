class Patient < User
  has_many :appointments, class_name: Appointment.name, foreign_key: :patient_id
  has_many :doctors, class_name: Doctor.name, through: :appointments
end
