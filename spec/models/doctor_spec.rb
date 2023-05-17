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
require 'rails_helper'

def create_more_appointments(num)
  num.times do
    create(:appointment, patient: patient, doctor: doctor)
  end
end

RSpec.describe Doctor, type: :model do
  it { should validate_presence_of(:phone) }

  describe "#phone" do
    let(:doctor) { build(:doctor) }
    let(:doctor_with_invalid_number) { build(:doctor, :invalid_number) }
    let(:doctor_with_short_number) { build(:doctor, :short_number) }

    context "with valid number" do
      it "should be valid" do
        expect(doctor).to be_valid
      end
    end

    context "with invalid number" do
      it "should be invalid" do
        expect(doctor_with_invalid_number).not_to be_valid
      end
    end

    context "with short number" do
      it "should be invalid" do
        expect(doctor_with_short_number).not_to be_valid
      end
    end
  end

  describe "#appointments" do
    let!(:patient) { build(:patient) }
    let(:doctor) { build(:doctor) }

    context "with too many appointments" do
      it "should not be valid" do
        create_more_appointments(10)
        expect(doctor).not_to be_valid
      end
    end
  end
end
