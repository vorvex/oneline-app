class Page < ApplicationRecord
  belongs_to :user
  belongs_to :website, dependent: :destroy
  has_one :hero
  has_one :service
  has_many :sections

  def children
    Page.where('parent_id = ?', self.id)
  end
  
  def parent
    Page.find(self.parent_id)
  end
  
  def self.index(website_id)
    where('website_id = ?', website_id).where('parent_id IS NULL').first
  end
  
  def ordered_sections
    self.sections.order('position ASC')
  end
 
end
