class Page < ActiveRecord::Base
	belongs_to :subject
	has_many :sections
	has_and_belongs_to_many :editors, :class_name => "AdminUser"

	acts_as_list :scope => :subject 

	validates_presence_of :name
	validates_length_of :name, :maximum => 255
	validates_presence_of :parmalink
	validates_length_of :parmalink, :within =>3..255

	validates_uniqueness_of :parmalink


	scope :visible, lambda { where(:visible => true) }
  	scope :invisible, lambda { where(:visible => false) }
  	scope :sorted, lambda { order("pages.position ASC") }
  	scope :newest_first, lambda { order("pages.created_at DESC")}
  
end