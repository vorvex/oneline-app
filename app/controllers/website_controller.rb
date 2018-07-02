class WebsiteController < ApplicationController
  
  def index
  as_html('index')
  end
  
  def page
  as_html('subpage')  
  end
  
  
  private
  
  def as_html(template) 
    @website = Website.find_by_url(params[:url])
    if @website.template
      @layout = @website.template
    else
      @layout = 'template_1'
    end
    @template = template
    if params[:name]
      @page = Page.find_by_name(params[:name])
    else 
      @page = @website.index
    end
    @sections = @page.ordered_sections
    render template: "website/#{@template}", layout: "template_#{@layout}"
  end
  
end