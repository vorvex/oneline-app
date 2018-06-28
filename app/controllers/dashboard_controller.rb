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
    
  def create_company
    @company = Company.new(company_params)
    @company.save
    redirect_to root_path
  end
  
  def datenverarbeitung
    respond_to do |format|
      format.pdf { send_formular_pdf }
 
      if Rails.env.development?
        format.html { render_sample_html }
      end
    end
    @company = current_user.company
  end
  
  private
    def company_params
      params.require(:company).permit(:user_id, :name, :strasse, :adresszusatz, :stadt, :plz, :ceo, :beauftragter)
    end
 
    def formular_pdf
      FormularPdf.new(current_user.company)
    end
  
    def send_formular_pdf
      send_file formular_pdf.to_pdf,
      filename: formular_pdf.filename,
      type: "application/pdf",
      disposition: "inline"
  end
end
