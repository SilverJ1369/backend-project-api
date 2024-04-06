class SessionsController < ApplicationController
  def create
    admin = Admin.find_by(username: params[:username])
    if admin&.authenticate(params[:password])
      token = jwt_encode(admin_id: admin.id)
      render json: { token: token }, status: :ok
    else
      render json: { error: "Unauthorized" }, status: :unauthorized
    end
  end

  private

  def jwt_encode(payload, exp = 24.hours.from_now)
    payload[:exp] = exp.to_i
    JWT.encode(payload, Rails.application.credentials.secret_key_base)
  end
end
