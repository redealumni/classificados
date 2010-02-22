class Category < ActiveRecord::Base
  
  has_many :ads
  
  validates_uniqueness_of :name
  
  has_permalink :name
  
  def to_param
    permalink
  end
  
end
