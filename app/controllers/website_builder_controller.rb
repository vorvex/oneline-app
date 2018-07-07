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
   Setting.create(website_id: @website.id)
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
    
  def edit_page
    @page = Page.find(params[:id])
    @sections = Section.where('page_id = ?', @page.id).order(:position)
    if @page.hero
      @hero = @page.hero
    else
      @hero = Hero.new
    end
    if @page.service
      @service = @page.service
    else
      @service = Service.new
    end    
  end
    
  def update_page
    @page = Page.find(params[:id])
    @page.parent_name = Page.find(params[:parent_id]).name if params[:parent_id]
    if @page.update(page_params)
      flash[:success] = "Seite wurde erfolgreich aktualisiert"
    else
      flash[:danger] = "Es gab ein Problem beim aktualisieren"
    end
    redirect_to page_path(@page.id)
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
      flash[:danger] = "Es gab ein Problem beim Erstellen des Abschnitts"
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
    redirect_to page_url(@section.page_id)
  end  
    
  def destroy_section
    @section = Section.find(params[:id])
    if @section.delete
      flash[:success] = "Abschnitt wurde erfolgreich gelöscht"
    else
      flash[:danger] = "Es gab ein Problem beim löschen"
    end
    redirect_to website_builder_path
  end

# Components
  
  def create_component
    @component = Component.new(component_params)
    if @component.save
      flash[:success] = "Element wurde erfolgreich erstellt"
    else
      flash[:danger] = "Es ist ein Fehler aufgetreten"
    end
      page = Section.find(@component.section_id).page
      redirect_to page_path(page)
  end
  
  def update_component
    @component = Component.find(params[:id])
    if @component.update(component_params)
      flash[:success] = "Element wurde erfolgreich aktualisiert"
    else
      flash[:danger] = "Es ist ein Fehler aufgetreten"
    end
    page = Section.find(@component.section_id).website_id
    redirect_to page_path(page)
  end
  
  def delete_component
    @component = Component.find(params[:id])
    if @component.delete
      flash[:success] = "Element wurde erfolgreich gelöscht"
    else
      flash[:danger] = "Es gab ein Problem beim löschen"
    end
    page = Section.find(@component.section_id).website_id
    redirect_to page_path(page)
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
    
  # Service
  
  def create_service
    @service = Service.new(service_params)
    if @service.save
      flash[:success] = "Element wurde erfolgreich erstellt"
    else
      flash[:danger] = "Es ist ein Fehler aufgetreten"
    end
      page = @service.page_id
      redirect_to page_path(page)
  end
  
  
  def update_service
    @service = Service.find(params[:id])
    if @service.update(service_params)
      flash[:success] = "Element wurde erfolgreich aktualisiert"
    else
      flash[:danger] = "Es ist ein Fehler aufgetreten"
    end
      page = @service.page_id
      redirect_to page_path(page)
  end
  
  def delete_service
    @service = Service.find(params[:id])
    if @service.delete
      flash[:success] = "Element wurde erfolgreich gelöscht"
    else
      flash[:danger] = "Es ist ein Fehler aufgetreten"
    end
      page = @service.page_id
      redirect_to page_path(page)
  end
  
  # Hero
  
  def create_hero
    @hero = Hero.new(hero_params)
    if @hero.save
      flash[:success] = "Element wurde erfolgreich erstellt"
    else
      flash[:danger] = "Es ist ein Fehler aufgetreten"
    end
      page = @hero.page_id
      redirect_to page_path(page)
  end
  
  
  def update_hero
    @hero = Hero.find(params[:id])
    if @hero.update(hero_params)
      flash[:success] = "Element wurde erfolgreich aktualisiert"
    else
      flash[:danger] = "Es ist ein Fehler aufgetreten"
    end
      page = @hero.page_id
      redirect_to page_path(page)
  end
  
  def delete_hero
    @hero = Hero.find(params[:id])
    if @hero.delete
      flash[:success] = "Element wurde erfolgreich gelöscht"
    else
      flash[:danger] = "Es ist ein Fehler aufgetreten"
    end
      page = @hero.page_id
      redirect_to page_path(page)
  end
  
  private
    
    def website_params
      params.require(:website).permit(:user_id, :setting_id, :url, :title, :description, :site_name, :layout, :header, :footer)
    end
    
    def setting_params
      params.require(:setting).permit(:website_id, :primary_color, :secondary_color, :tertiary_color, :background_color, :font, :font_color, :header_color, :footer_color, :logo)
    end
    
    def page_params
      params.require(:page).permit(:website_id, :user_id, :parent_id, :parent_name, :name, :template, :contact, :map)
    end
    
    def section_params
      params.require(:section).permit(:page_id, :category, :header, :subheader, :component_one, :component_two, :component_three, :component_four, :background, :background_image)
    end
    
    def component_params
      params.require(:component).permit(:section_id, :category, :position, :heading, :subheading, :content, :image)
    end

    def service_params
      params.require(:service).permit(:page_id, :style, :header_service_one, :description_service_one, :button_service_one, :link_service_one, :header_service_two, :description_service_two, :button_service_two, :link_service_two, :header_service_three, :description_service_three, :button_service_three, :link_service_three, :header_service_four, :description_service_four, :button_service_four, :link_service_four, :icon_service_one, :icon_service_two, :icon_service_three, :icon_service_four)
    end
  
    def hero_params
      params.require(:hero).permit(:page_id, :style, :header_slide_one, :subheader_slide_one, :button_slide_one, :link_slide_one, :header_slide_two, :subheader_slide_two, :button_slide_two, :link_slide_two, :header_slide_three, :subheader_slide_three, :button_slide_three, :link_slide_three, :header_slide_four, :subheader_slide_four, :button_slide_four, :link_slide_four, :image_slide_one, :image_slide_two, :image_slide_three, :image_slide_four)
    end
    
    def create_components(count, section)
      for item in 1..count
        Component.create(position: item, section_id: section)
      end
    end
end
