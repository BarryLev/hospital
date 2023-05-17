class AppointmentsController < ApplicationController
  load_and_authorize_resource only: [:edit, :update]
  before_action :authenticate_user!

  def create
    @appointment = Appointment.new(patient_id: current_user.id, doctor_id: params[:id])

    if @appointment.save
      redirect_to user_path(current_user.id)
    else
      redirect_to root_path
    end
  end

  def edit
    @appointment = resource
  end

  def update
    @appointment = resource

    if @appointment.update(appointment_params)
      redirect_to user_path(@appointment.patient_id)
    else
      render :edit
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
