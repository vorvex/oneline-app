class OnboardingController < ApplicationController
  
  # Start
  def start 
    @company = Company.new
  end
  
  # Unternehmensname
  def step0
    @company = Company.new
    # @company = Company.create!(name: params[:name])
    respond_to do |format|
      format.js { render partial: 'onboarding/step0' }
    end
  end
  
  # Geschäftsführer
  def step1
    @company = Company.new
    # @company = current_user.company
    # @company.update(ceo: params[:ceo])
    respond_to do |format|
      format.js { render partial: 'onboarding/step1' }
    end
  end
  
  # Branche
  def step2
    @company = Company.new 
    if params[:company][:field] === 'sonstige'
      respond_to do |format|
        format.js { render partial: 'onboarding/step2a' }
      end
    else
      # @company = current_user.company
      # @company.update(field: params[:field])
      respond_to do |format|
        format.js { render partial: 'onboarding/step2' }
      end
    end
  end
  
  # Sonstige Branche
  def step2a
    @company = current_user.company
    @company.update(field: params[:field])
    respond_to do |format|
      format.js { render partial: 'onboarding/step2' }
    end
  end
  
  # Anschrift
  def step3
    @company = Company.new
    respond_to do |format|
      format.js { render partial: 'onboarding/step3' }
    end
  end
  
  # Hauptstandort
 def step4
    @company = Company.new
    respond_to do |format|
      format.js { render partial: 'onboarding/step4' }
    end
  end
  
  # Anschrift 2
  def step4a
    @company = Company.new
    respond_to do |format|
      format.js { render partial: 'onboarding/step4a' }
    end
  end
  
  # Anscrift 2 Speichern
  def step4b 
    @company = Company.new
    respond_to do |format|
      format.js { render partial: 'onboarding/step5' }
    end
  end
  
  # MyBusiness Start
  def step5
    @company = Company.new
    respond_to do |format|
      format.js { render partial: 'onboarding/step5' }
    end
  end
  
  # Service Area
  def step6
    @company = Company.new
    if params[:commit] === 'Vorort'
      respond_to do |format|
        format.js { render partial: 'onboarding/step6' }
      end
    elsif params[:commit] ==='Außerhalb'
      respond_to do |format|
        format.js { render partial: 'onboarding/step6a' }
      end
    elsif params[:commit] === 'Beides'
      respond_to do |format|
        format.js { render partial: 'onboarding/step6a' }
      end
    end
  end
  
  
  # Range
  def step6a
    @company = Company.new
    respond_to do |format|
      format.js { render partial: 'onboarding/step6' }
    end 
  end
  
  # Telephone
  def step7
    @company = Company.new
    respond_to do |format|
      format.js { render partial: 'onboarding/step7' }
    end
  end
  
    # Business Hours
  def step8
    @company = Company.new
    respond_to do |format|
      format.js { render partial: 'onboarding/step8' }
    end
  end
  
  # Google Start (Webseite?)
  def step9
    @company = Company.new
    respond_to do |format|
      format.js { render partial: 'onboarding/step9' }
    end
  end
  
  # No Website
  def step9a
    @company = Company.new
    respond_to do |format|
      format.js { render partial: 'onboarding/step9a' }
    end
  end
  
  # URL
  def stepa10
    @company = Company.new
    respond_to do |format|
      format.js { render partial: 'onboarding/stepa10' }
    end
  end
  
  # Google?
  def stepa11
    @company = Company.new
    respond_to do |format|
      format.js { render partial: 'onboarding/stepa11' }
    end
  end
  
  # Google Anmelden
  def stepa12
    @company = Company.new
    respond_to do |format|
      format.js { render partial: 'onboarding/stepa12' }
    end
  end
  
  # Kein Google Akkount
  def stepa12a
    
  end
  
  # Google OAuth Failure
  def google_oauth_failure
    
  end
  
  # Google OAuth Success - Ziele
  def google_oauth_success
    
  end
  
  # Soziale Medien
  def step13
    
  end
  
  # Fertig
  def finish
    
  end

private
  
end