class WebsiteController < ApplicationController
  
  def index
  as_html('index')
  end
  
  def page
  as_html('page')  
  end
  
  def sitemap
    
  end
  
  def datenschutz
  as_html('datenschutz')  
  end
  
  def impressum
    
  end
  
  def articles
    
  end
  
  def article
    
  end
  
  def galerie
    
  end
  
  private
  
  def as_html(template) 
    @website = Website.find_by_url(params[:url])
    if @website.layout
      @layout = @website.layout
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
    render template: "website/1/#{@template}", layout: "template_#{@layout}"
  end
  
end