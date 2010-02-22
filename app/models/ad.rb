require 'digest/sha1'
class Ad < ActiveRecord::Base

  KINDS = {:buy => "compra", :sell => "venda", :exchange => "troca"}
  
  attr_protected :secret_code
  
  before_create :generate_secret_code
  after_create :send_confirmation_email
  
  named_scope :ordered_by_creation, :order => "created_at DESC"
  named_scope :created_after, lambda{ |time| {:conditions => ["created_at > ?", time ]} }
  named_scope :of_kind, lambda{ |kind| {:conditions => ["kind = ?", kind ]} }
  
  has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  
  belongs_to :category
  
  validates_presence_of :title, :body, :kind, :category_id
  validates_length_of :title, :within => 5..50
  validates_length_of :body, :within => 20..500
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/
  
  protected

  def send_confirmation_email
    Mailer.deliver_ad_creation(self)
  end
  
  def generate_secret_code
    self.secret_code = Digest::SHA1.hexdigest("EsteConteúdoDeveSerSuperSecreto!!!#{Time.now.to_s.split(//).sort_by {rand}}#{self.title}#{self.email}")
  end
  
end
