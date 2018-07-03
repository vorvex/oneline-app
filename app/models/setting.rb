class Setting < ApplicationRecord
  belongs_to :website
  has_one_attached :logo
  
end
