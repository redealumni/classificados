class Category < ActiveRecord::Base
  
  has_many :ads
  
  validates_uniqueness_of :name
  
  has_permalink :name
  
  has_attached_file :photo, :styles => { :thumb => "100x100>", :tiny => "50x50>" }
  
  def to_param
    permalink
  end
  
end
