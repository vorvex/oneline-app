class ComponentController < ApplicationController

  def sort
    params[:component].each_with_index do |id, index|
      Component.where(id: id).update_all(position: index + 1)
    end
  end
  
end