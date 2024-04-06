class AdminsController < ApplicationController
  def create
    admin = Admin.new(admin_params)
    if admin.save
      render json: admin, status: :created
    else
      render json: admin.errors, status: :unprocessable_entity
    end
  end

  private

  def admin_params
    params.require(:admin).permit(:username, :email, :first_name, :last_name, :password, :password_confirmation)
  end
end
