class AppointmentsController < ApplicationController
  load_and_authorize_resource only: [:edit, :update]
  before_action :authenticate_user!

  def create
    if Appointment.create(patient_id: current_user.id, doctor_id: params[:id])
      redirect_to user_path(current_user.id)
    else
      render :show
    end
  end

  def edit
    @appointment = resource
  end

  def update
    @appointment = resource
    binding.pry

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
