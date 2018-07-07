class Setting < ApplicationRecord
  belongs_to :website, dependent: :destroy
  has_one_attached :logo
  
end
