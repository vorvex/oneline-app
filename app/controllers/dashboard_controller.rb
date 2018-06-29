class DashboardController < ApplicationController
  before_action :authenticate_user!, :welcome, :authenticate_company!
  def index
    @company = Company.find_by_user_id(current_user.id)
  end
  
end
