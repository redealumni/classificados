class Category < ActiveRecord::Base
  
  has_many :ads, :dependent => :destroy
  
  validates_uniqueness_of :name
  
  has_permalink :name
  
  has_attached_file :photo, :styles => { :thumb => "100x100>", :tiny => "50x50>" }
  
  named_scope :ordered_by_name, :order => "name ASC"
  
  #A categoria padrão é a primeira criada
  def self.default
    Category.first
  end
  
  def to_param
    permalink
  end
  
end
