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
class User < ApplicationRecord
  self.inheritance_column = :role

  devise :database_authenticatable, :registerable,
         :rememberable, :validatable

  has_one_attached :avatar

  validates :phone, presence: :true, format: /\A0\d{9}\z/
  validates_presence_of :name

  # overrided methods email_required? and will_save_change_to_email?
  # from devise to make phone as login
  def email_required?
    false
  end

  def will_save_change_to_email?
    false
  end

  def patient?
    role == Patient.name
  end

  def doctor?
    role == Doctor.name
  end

  def admin?
    role == Admin.name
  end
end
