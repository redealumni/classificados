class Ad < ActiveRecord::Base
  KINDS = {:buy => "compra", :sell => "venda", :exchange => "troca"}
  
  named_scope :ordered_by_creation, :order => "created_at DESC"
  named_scope :created_after, lambda{ |time| {:conditions => ["created_at > ?", time ]} }
  named_scope :of_kind, lambda{ |kind| {:conditions => ["kind = ?", kind ]} }
  
  has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  
  belongs_to :category
  
end
