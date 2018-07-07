class Service < ApplicationRecord
  belongs_to :page, dependent: :destroy
  has_one_attached :icon_service_one
  has_one_attached :icon_service_two
  has_one_attached :icon_service_three
  has_one_attached :icon_service_four
  
  def count
    if self.header_service_two === "" && self.description_service_two === ""
      return 1
    elsif self.header_service_three === "" && self.description_service_three === ""
      return 2
    elsif self.header_service_four === "" && self.description_service_four === ""
      return 3
    else
      return 4
    end      
  end
  
end
