class SectionController < ApplicationController

  def sort
    params[:section].each_with_index do |id, index|
      Section.where(id: id).update_all(position: index + 1)
    end
  end
  
  def create_modal
    @section = Section.new
    @page = Page.find(params[:id])
    respond_to do |format|
      format.js { render partial: 'website_builder/ajax/create_modal_section' }
    end  
  end
  
  def create
    
  end
  
  def update_modal
    @section = Section.find(params[:id])
    respond_to do |format|
      format.js { render partial: 'website_builder/ajax/update_modal_section' }
    end
  end
  
  def update
    
  end
  
  def delete
    
  end
  
private
  def section_params
    params.require(:section).permit(:page_id, :category, :header, :subheader, :component_one, :component_two, :component_three, :component_four, :background, :background_image)
  end
  
end