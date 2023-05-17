class AppointmentsController < ApplicationController
  load_and_authorize_resource only: [:edit, :update]
  before_action :authenticate_user!

  def create
    @appointment = Appointment.new(patient_id: current_user.id, doctor_id: params[:id])

    if @appointment.save
      redirect_to user_path(current_user.id), notice: "Appointment has been successfully created"
    else
      redirect_to root_path, alert: "Appointment has failed create"
    end
  end

  def edit
    @appointment = resource
  end

  def update
    @appointment = resource

    if @appointment.update(appointment_params)
      success_message = "Recommendation has been successfully created. Now your appointment is no longer active."
      redirect_to user_path(@appointment.patient_id), notice: success_message
    else
      render :edit, alert: "Recommendation has failed to create!"
    end
  end

  private

  def resource
    Appointment.find(params[:id])
  end

  def appointment_params
    params.require(:appointment).permit(:recommendation)
  end
end
