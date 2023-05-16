class DoctorsController < ApplicationController
  before_action :authenticate_user!, only: :update

  def index
    @doctors = collection
  end

  def show
    @doctor = resource
  end

  def update
    @doctor = resource

    @doctor.appointments.build(patient_id: current_user.id)

    if @doctor.save
      redirect_to user_path(current_user.id)
    else
      render :show
    end
  end

  private

  def collection
    Doctor.where(category_id: params[:category_id])
  end

  def resource
    Doctor.find(params[:id])
  end
end
