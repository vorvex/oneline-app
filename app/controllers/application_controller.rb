class ApplicationController < ActionController::Base
  before_action :set_locale
  helper_method :authenticate_admin!, :authenticate_company!, :current_admin?, :welcome, :bootstrap_class_for
  
  def set_locale
    I18n.locale = 'de' || I18n.default_locale
  end
  
  def authenticate_admin!
    @user = User.find(current_user.id)
    if @user.role_name != 'admin'
      redirect_to root_path
    end
  end
  
  def authenticate_company!
    if current_user.company.nil?
      flash[:notice] = "Bitte tragen Sie zuerst Ihre Daten eintragen"
      redirect_to company_path
    end
  end
  
  def current_admin?
    current_user.admin?
  end
  
  def welcome
    if current_user.sign_in_count == 1
      redirect_to edit_user_registration_path
    end  
  end
  
   def bootstrap_class_for flash_type
    case flash_type
      when :success
        "alert-success"
      when :error
        "alert-error"
      when :alert
        "alert-block"
      when :notice
        "alert-info"
      else
        flash_type.to_s
    end
  end
  
end
