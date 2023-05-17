class UsersController < ApplicationController
  def show
    @user = resource
  end

  def edit
    @user = resource
  end

  def update
    @user = resource

    if @user.update(user_params)
      redirect_to user_path(@user), notice: "Your avatar was updated successfully"
    elsif
      redirect_back_or_to user_path(@user), alert: "Error occured while updating avatar"
    end
  end

  private

  def user_params
    params.require(@user.role.downcase).permit(:avatar)
  end

  def resource
    User.find(params[:id])
  end
end
