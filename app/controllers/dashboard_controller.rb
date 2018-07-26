class DashboardController < ApplicationController
  before_action :authenticate_user!
  def index
    welcome!
    @company = Company.find_by_user_id(current_user.id)
  end
  
  def user_introduction
    @company = Company.new
  end  
  
  def create_company
    @company = Company.new(company_params)
    if @company.save
      flash.now[:success] = "Unternehmensdaten wurden erfolgreich angelegt."
    else
      flash.now[:danger] = "Es ist ein Fehler aufgetreten"
    end
    respond_to do |format|
      format.js { render partial: 'dashboard/website' }
    end
  end
  
  def has_website 
    respond_to do |format|
      format.js { render partial: 'dashboard/google' }
    end
  end
  
  def no_website 
    
  end
  
  def no_google
    
  end
  
private
  def company_params
    params.require(:company).permit(:user_id, :name, :strasse, :adresszusatz, :plz, :stadt, :ceo, :datenschutz)
  end
  
end
