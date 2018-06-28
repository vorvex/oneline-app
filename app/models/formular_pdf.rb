require "render_anywhere"
 
class FormularPdf
  include RenderAnywhere
 
  def initialize(formular)
    @formular = formular
  end
 
  def to_pdf
    kit = PDFKit.new(as_html, page_size: 'A4')
    kit.to_file("#{Rails.root}/public/#{formular.id}.pdf")
  end
 
  def filename
    "Invoice #{formular.id}.pdf"
  end
 
  private
 
    attr_reader :formular
 
    def as_html
      render template: "formular/pdf", layout: "formular_pdf", locals: { formular: formular }
    end
end