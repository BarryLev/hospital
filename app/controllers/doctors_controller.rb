class DoctorsController < ApplicationController
  def index
    @doctors = collection
  end

  def show
    @doctor = resource
  end

  private

  def collection
    Doctor.where(category_id: params[:category_id])
  end

  def resource
    Doctor.find(params[:id])
  end
end
