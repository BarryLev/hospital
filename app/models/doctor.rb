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
class Doctor < User
  has_many :appointments, class_name: Appointment.name, foreign_key: :doctor_id
  has_many :patients, class_name: Patient.name, through: :appointments
  
  belongs_to :category

  validates_presence_of :category

  validate :limit_active_appointments

  private

  def limit_active_appointments
    limit = 10

    errors.add("Too many active appointments") if appointments.where(active: true).count > limit
  end
end
