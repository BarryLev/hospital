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
  belongs_to :user
  belongs_to :doctor

  validates_presence_of :active
end
