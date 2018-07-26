class DownloadController < ApplicationController
  before_action :authenticate_user!, :authenticate_company!
  def index
    @formulars = FormularCreator.all
  end
  
  def formular
    respond_to do |format|
      format.pdf { send_formular_pdf }
      if Rails.env.development?
        format.html { render_sample_html }
      end
    end

  end
  
  private
  
  def formular_pdf
      @name = FormularCreator.find_by_name(params[:name])
      company = CompanyDrop.new(current_user.company)
      formular = Liquid::Template.parse(@name.content)
      @formular = formular.render('company' => company)
      FormularPdf.new(@formular, @name)
    end
  
    def send_formular_pdf
      send_file formular_pdf.to_pdf,
      filename: formular_pdf.filename,
      type: "application/pdf",
      disposition: "inline"
  end
  
    def render_sample_html 
      @name = FormularCreator.find_by_name(params[:name])
      company = CompanyDrop.new(current_user.company)
      formular = Liquid::Template.parse(@name.content)
      @formular = formular.render('company' => company)
      render template: "formular/pdf", layout: "formular_pdf"
    end
end
