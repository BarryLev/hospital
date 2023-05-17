require 'rails_helper'

RSpec.describe "Appointments", type: :request do
  describe "POST /appointments" do
    let(:patient) { create(:patient) }
    let(:doctor) { create(:doctor) }
    let(:invalid_doctor_id) { 0 }

    before { sign_in patient }

    context "with valid doctor id" do
      it "creates a new appointment" do
        expect do
          post appointments_path, params: { id: doctor.id }
        end.to change(Appointment, :count).by(1)

        expect(response).to redirect_to(user_path(patient))
        expect(flash[:notice]).to eq("Appointment has been successfully created")
      end
    end

    context "with invalid doctor id" do
      it "does not create an appointment" do
        expect do
          post appointments_path, params: { id: invalid_doctor_id }
        end.not_to change(Appointment, :count)

        expect(response).to redirect_to(root_path)
        expect(flash[:alert]).to eq("Appointment has failed create")
      end
    end
  end
end
