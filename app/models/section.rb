class Section < ApplicationRecord
  belongs_to :page
  has_many :components
  
  def columns
    case self.category
      when "1"
        return "1"
      when "2"
        return "2"
      when "2_3-9"
        return "2"
      when "2_9-3"
        return "2"
      when "3"
        return "3"
      when "4"
        return "4"
      when "2_img-left"
        return "2"
      when "2_img-right"
        return "2"
      when "2_3-9_img"
        return "2"
      when "2_9-3_img"
        return "2"
    end
  end

  def first_column
    case self.category
      when "1"
        return "12"
      when "2"
        return "6"
      when "2_3-9"
        return "3"
      when "2_9-3"
        return "9"
      when "3"
        return "4"
      when "4"
        return "3"
      when "2_img-left"
        return "6"
      when "2_img-right"
        return "6"
      when "2_3-9_img"
        return "3"
      when "2_9-3_img"
        return "9"
    end
  end
  
  def second_column
    case self.category
      when "1"
        return nil
      when "2"
        return "6"
      when "2_3-9"
        return "9"
      when "2_9-3"
        return "3"
      when "3"
        return "4"
      when "4"
        return "3"
      when "2_img-left"
        return "6"
      when "2_img-right"
        return "6"
      when "2_3-9_img"
        return "9"
      when "2_9-3_img"
        return "3"
    end
  end
  
  def column_type(column)
    case self.category
      when "2_img-left"
        if column == 1
          return "img"
        elsif column == 2
          return "content"
        end
      when "2_img-right"
        if column == 1
          return "content"
        elsif column == 2
          return "img"
        end
      when "2_3-9_img"
        if column == 1
          return "img"
        elsif column == 2
          return "content"
        end
      when "2_9-3_img"
        if column == 1
          return "content"
        elsif column == 2
          return "img"
        end
      else
        return "complete"
    end
  end
  
  def second_column_img
    case self.category
      when "2_img-right"
        true
      when "2_9-3_img"
        true
      else
        false
    end
  end
end
