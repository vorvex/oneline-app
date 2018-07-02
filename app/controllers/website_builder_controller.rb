class WebsiteBuilderController < ApplicationController
  def index
    if current_user.website.nil?
      redirect_to new_website_path
    else
      @website = current_user.website
      @pages = current_user.website.pages
    end
  end

  def new_website
   @website = Website.new
  end

  def create_website
   @website = Website.new(website_params)
   @website.save
   Setting.create(website_id: @website)
   redirect_to website_settings_path
  end

  def edit_website
    @website = current_user.website
  end
    
  def update_website
    @website = current_user.website
    if @website.update(website_params)
      flash[:success] = "Webseite wurde erfolgreich aktualisiert"
    else
      flash[:danger] = "Es gab ein Problem beim aktualisieren"
    end
    redirect_to website_builder_path
  end
    
  # Pages
    
  def new_page
    @page = Page.new
  end
  
  def create_page
    @page = Page.new(page_params)
    @page.parent_name = Page.find(params[:parent_id]).name if params[:parent_id]
    if @page.save
      flash[:success] = "Seite wurde erfolgreich erstellt"
      redirect_to website_builder_path
    else
      flash[:danger] = "Es gab ein Problem beim erstellen der Seite"
      render website_builder_path
    end
  end
    
  def show_page
    @page = Page.find(params[:id])
    @sections = Section.where('page_id = ?', @page.id)
  end
    
  def edit_page
    @page = Page.find(params[:id])
  end  
    
  def update_page
    @page = Page.find(params[:id])
    @page.parent_name = Page.find(params[:parent_id]).name if params[:parent_id]
    if @page.update(page_params)
      flash[:success] = "Seite wurde erfolgreich aktualisiert"
    else
      flash[:danger] = "Es gab ein Problem beim aktualisieren"
    end
    redirect_to website_builder_path
  end  
    
  def delete_page
    @page = Page.find(params[:id])
    @sections = Section.where('page_id = ?', @page.id)
    if @sections.destroy
      @page.destroy
      flash[:success] = "Seite wurde erfolgreich gelöscht"
    else
      flash[:danger] = "Es gab ein Problem beim löschen"
    end
    redirect_to website_builder_path
  end
    
  # Sections  
    
  def new_section
    @section = Section.new
  end
  
  def create_section
    @section = Section.new(section_params)
    if @section.save
      flash[:success] = "Abschnitt wurde erfolgreich erstellt"
    else
      flash[:danger] = "Es gab ein Problem beim erstellen des Abschnitts"
    end
    page_id = params[:section][:page_id]
    redirect_to page_url(page_id)
  end
    
  def edit_section
    @section = Section.find(params[:id])
  end  
    
  def update_section
    @section = Section.find(params[:id])
    if @section.update(section_params)
      flash[:success] = "Abschnitt wurde erfolgreich aktualisiert"
    else
      flash[:danger] = "Es gab ein Problem beim aktualisieren"
    end
    page_id = params.require(:section).permit(:page_id)
    redirect_to page_url(page_id)
  end  
    
  def delete_section
    @section = section.find(params[:id])
    if @sections.destroy
      @section.destroy
      flash[:success] = "Abschnitt wurde erfolgreich gelöscht"
    else
      flash[:danger] = "Es gab ein Problem beim löschen"
    end
    redirect_to website_builder_path
  end

# Website Settings    
    
  def website_settings
    if current_user.website.setting.nil?
      @setting = Setting.new
    else
      @setting = current_user.website.setting
    end
  end
  
  def create_settings
    @path = "create_settings_path"
    @setting = Setting.new(setting_params)
    if @setting.save
      flash[:success] = "Einstellungen wurden erfolgreich aktualisiert"
      redirect_to website_settings_path
    else
      flash[:danger] = "Es gab ein Problem beim aktualisieren"
      render website_settings_path
    end
  end
    
  def update_settings
    @path = "update_settings_path"
    @setting = current_user.website.setting
    if @setting.update(setting_params)
      flash[:success] = "Einstellungen wurden erfolgreich aktualisiert"
    else
      flash[:danger] = "Es gab ein Problem beim aktualisieren"
    end
    redirect_to website_settings_path
  end
    
  private
    
    def website_params
      params.require(:website).permit(:user_id, :setting_id, :url, :title, :description, :site_name, :template, :google_analytics_key)
    end
    
    def setting_params
      params.require(:setting).permit(:website_id, :primary_color, :secondary_color, :tertiary_color, :background_color, :font)
    end
    
    def page_params
      params.require(:page).permit(:website_id, :user_id, :parent_id, :parent_name, :name)
    end
    
    def section_params
      params.require(:section).permit(:page_id, :position, :category, :content )
    end
    
end
