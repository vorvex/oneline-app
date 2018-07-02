class Website < ApplicationRecord
has_one :setting
belongs_to :user
has_many :pages

  def index
    pages.where('parent_id IS NULL').first 
  end
  
  
end
