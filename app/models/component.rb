class Component < ApplicationRecord
  belongs_to :section
  has_one_attached :image

end
