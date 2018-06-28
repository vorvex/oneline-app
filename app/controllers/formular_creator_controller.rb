class FormularCreatorController < ApplicationController
  def index
    @formulars = FormularCreator.all
  end

  def new
    @formular = FormularCreator.new
  end

  def create
    @formular = FormularCreator.new(formular_params)
    @formular.save
    redirect_to root_path
  end

  def edit
    @formular = FormularCreator.find(params[:id])
  end

  def update
    @formular = FormularCreator.find(params[:id])
    @formular.update(formular_params)
    redirect_to root_path
  end

  def destroy
    @formular = FormularCreator.find(params[:id])
    @formular.destroy
    redirect_to root_path
  end
  
  private
  
  def formular_params
    params.require(:formular).permit(:name, :content)
  end
end
