class ComponentController < ApplicationController

  def sort
    params[:component].each_with_index do |id, index|
      Component.where(id: id).update_all(position: index + 1)
    end
  end
  
  def create_modal 
    @component = Component.new
    @section = params[:section]
    @position = params[:position]
    respond_to do |format|
      format.js { render partial: 'website_builder/ajax/create_modal_component' }
    end  
  end
  
  def create
    @component = Component.new(component_params)
    if @component.save
      flash.now[:success] = "Element wurde erfolgreich erstellt"
    else
      flash.now[:danger] = "Es ist ein Fehler aufgetreten"
    end
    respond_to do |format|
      format.js { render partial: 'website_builder/ajax/update_component' }
    end
  end
  
  def update_modal
    @component = Component.find(params[:id])
    respond_to do |format|
      format.js { render partial: 'website_builder/ajax/update_modal_component' }
    end
  end
  
  def update 
    @component = Component.find(params[:id])
    if @component.update(component_params)
      flash.now[:success] = "Element wurde erfolgreich erstellt"
    else
      flash.now[:danger] = "Es ist ein Fehler aufgetreten"
    end
    respond_to do |format|
      format.js { render partial: 'website_builder/ajax/update_component' }
    end
  end
  
  def delete
    @component = Component.find(params[:id])
    @position = @component.position
    @section = @component.section_id
    if @component.delete
      respond_to do |format|
        format.js { render partial: 'website_builder/ajax/delete_component' }
      end
    end
  end
  
  private
  
  def component_params
    params.require(:component).permit(:section_id, :category, :position, :heading, :subheading, :content, :image)
  end
end