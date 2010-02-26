require 'digest/sha1'
class Ad < ActiveRecord::Base
  
  KINDS = %w[sell buy exchange]
  
  attr_protected :secret_code
  
  after_create :send_confirmation_email
  
  named_scope :ordered_by_creation, :order => "created_at DESC"
  named_scope :created_after, lambda{ |time| {:conditions => ["created_at > ?", time ]} }
  named_scope :of_kind, lambda{ |kind| {:conditions => ["kind = ?", kind.to_s ]} }
  named_scope :search, lambda { |query|
    words = query.split(/\s/)
    final_sql = Array.new(words.size, "(title LIKE ? OR body LIKE ?)").join(" AND ")
    sql_params = words.map{|w| ["%#{w}%", "%#{w}%"]}.flatten
    {:conditions => [final_sql, sql_params].flatten }
  }
  
  has_attached_file :photo, :styles => { :medium => "200x200>", :thumb => "100x100>" }
  
  belongs_to :category
  
  validates_presence_of :title, :body, :kind, :category_id
  validates_length_of :title, :within => 5..50
  validates_length_of :body, :within => 20..500
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/
  validates_inclusion_of :kind, :in => KINDS
    
  def secret_code
    Digest::SHA1.hexdigest("#{SECRET}---|||----#{self.id}---|||----#{self.created_at_before_type_cast}")
  end
  
  protected

  def send_confirmation_email
    Mailer.deliver_ad_creation(self)
  end
  
end
