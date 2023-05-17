class DoctorsController < ApplicationController
  def index
    @doctors = collection
  end

  def show
    @doctor = resource
  end

  private

  def collection
    if params[:category_id].present?
      Doctor.where(category_id: params[:category_id])
    else
      Doctor.all
    end
  end

  def resource
    Doctor.find(params[:id])
  end
end
