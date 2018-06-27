class DashboardController < ApplicationController
  def index
    if user_signed_in?
      if current_user.company.nil?
        redirect_to company_path
      else
        
      end
    else
      redirect_to login_path
    end
  end
  
  def company
    @company = Company.new()
  end
    
  def create_company
    @company = Company.new(company_params)
    @company.save
    redirect_to root_path
  end
  
  private
    def company_params
    params.require(:company).permit(:user_id, :name, :strasse, :adresszusatz, :stadt, :plz, :ceo, :beauftragter)
  end
end
