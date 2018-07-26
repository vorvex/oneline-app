class ApplicationController < ActionController::Base
  before_action :set_locale
  helper_method :authenticate_admin!, :welcome!, :current_admin?, :bootstrap_class_for, :current_company

  def current_company
    @current_company ||= Company.find(session[:company_id]) if session[:company_id]
  end
  
  def set_locale
    I18n.locale = 'de' || I18n.default_locale
  end
  
  def active
    @active = 'Index'
  end
  
  def authenticate_admin!
    @user = User.find(current_user.id)
    if @user.role_name != 'admin'
      redirect_to root_path
    end
  end
  
  def current_admin?
    current_user.admin?
  end
  
  def welcome!
    if current_user.company.nil?
      redirect_to user_introduction_path
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
