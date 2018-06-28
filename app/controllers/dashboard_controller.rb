class DashboardController < ApplicationController
  def index
    if user_signed_in?
      if current_user.company.nil?
        redirect_to company_path
      else
        @company = Company.find_by_user_id(current_user.id)
      end
    else
      redirect_to login_path
    end
  end
  
  def company
    @company = Company.new()
  end

end
