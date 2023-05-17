require 'rails_helper'

RSpec.feature "GiveRecommendations", type: :feature do
  describe "give recommendations to the patient" do
    let!(:patient) { create(:patient) }
    
    let(:doctor) { create(:doctor) }
    let(:recommendation_text) { "Recommendation" }

    subject! { create(:appointment, patient: patient, doctor: doctor) }

    context "with doctor signed in" do
      it "gives recommendation to the patient" do
        visit new_user_session_path
        page.find("#user_phone").fill_in(with: doctor.phone)
        page.find("#user_password").fill_in(with: doctor.password)
        click_button "Log in"

        visit user_path(doctor)
        find("a", text: "Edit").click
        page.find("#appointment_recommendation").fill_in(with: recommendation_text)
        click_button "Submit"

        subject.reload

        expect(subject.recommendation).to eq(recommendation_text)
        expect(subject.active).to be false
      end
    end
  end
end
