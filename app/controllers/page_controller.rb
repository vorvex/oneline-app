class PageController < ApplicationController
  
  def update_modal
    @page = Page.find(params[:id])
    respond_to do |format|
      format.js { render partial: 'website_builder/ajax/update_modal_page' }
    end
  end
  
private
  
  def page_params
    params.require(:page).permit(:website_id, :user_id, :parent_id, :parent_name, :name, :template, :contact, :map)
  end
  
end