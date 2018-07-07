class SectionController < ApplicationController

  def sort
    params[:section].each_with_index do |id, index|
      Section.where(id: id).update_all(position: index + 1)
    end
  end
  
end