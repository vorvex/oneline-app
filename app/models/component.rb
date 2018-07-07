class Component < ApplicationRecord
  belongs_to :section, dependent: :destroy
  has_one_attached :image

end
