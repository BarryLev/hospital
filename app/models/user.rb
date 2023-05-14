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
#  name                   :string
#
class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :appointments
  has_many :doctors, through: :appointments

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
end
