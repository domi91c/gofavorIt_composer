class Profile < ActiveRecord::Base


	acts_as_avatarable

	belongs_to :user
	has_one :location
	has_one :gallery
	validates_presence_of :gallery
	has_many :pictures, through: :gallery

	has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
	validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

	do_not_validate_attachment_file_type :avatar

end
