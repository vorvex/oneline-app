require "render_anywhere"
 
class FormularPdf
  include RenderAnywhere
 
  def initialize(formular, name)
    @formular = formular
    @name = name
  end
 
  def to_pdf
    kit = PDFKit.new(as_html, page_size: 'A4')
    kit.to_file("#{Rails.root}/public/#{@name.name}.pdf")
  end
 
  def filename
    "#{@name.name}.pdf"
  end
 
  private
 
    attr_reader :formular
 
    def as_html
      render template: "formular/pdf", layout: "formular_pdf", locals: { formular: @formular}
    end
end