class AuthSessionsController < ApplicationController
  def create
    company = Company.from_omniauth(env["omniauth.auth"])
    session[:company_id] = company.id
    redirect_to root_path
  end

  def destroy
    session[:company_id] = nil
    redirect_to root_path
  end
end
