class SettingsController < ApplicationController
  
  def index
    
  end
  
  def company
    @company = Company.new()
  end
  
  def create_company
    @company = Company.new(company_params)
    @company.save
    redirect_to root_path
  end
  
  def edit_company
    @company = current_user.company
  end
  
  def update_company
    @company = current_user.company
    @company.update(company_params)
    redirect_to root_path
  end
  
  private
  
  def company_params
    params.require(:company).permit(:user_id, :name, :strasse, :adresszusatz, :stadt, :plz, :ceo, :beauftragter)
  end
end
