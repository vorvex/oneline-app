class Hero < ApplicationRecord
  belongs_to :page, dependent: :destroy
  has_one_attached :image_slide_one
  has_one_attached :image_slide_two
  has_one_attached :image_slide_three
  has_one_attached :image_slide_four

  def count
    if self.header_slide_two === "" && self.description_slide_two === ""
      return 1
    elsif self.header_slide_three === "" && self.description_slide_three === ""
      return 2
    elsif self.header_slide_four === "" && self.description_slide_four === ""
      return 3
    else
      return 4
    end      
  end
  
end
