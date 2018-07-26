class Component < ApplicationRecord
  belongs_to :section, dependent: :destroy
  has_one_attached :image

  
  def preview
    case self.category
      when "img"
        return '<i class="fa fa-image"></i>'
      when "content"
        return self.content
      when "complete"
        return self.heading
      end
  end
  
end
