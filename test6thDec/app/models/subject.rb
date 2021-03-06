class Subject < ActiveRecord::Base

	has_many :pages

  acts_as_list

	validates :name , :presence => true,
					  :length => { :maximum =>255},
					  :uniqueness => true
  	scope :visible, lambda { where(:visible => true) }
  	scope :invisible, lambda { where(:visible => false) }
  	scope :sorted, lambda { order("subjects.position ASC") }
  	scope :newest_first, lambda { order("subjects.created_at DESC")}
  	scope :search, lambda {|query|
    where(["name LIKE ?", "%#{query}%"])
 	}

end
