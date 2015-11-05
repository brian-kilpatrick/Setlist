class Organization < ActiveRecord::Base
	has_many :songs
	has_many :setlists
	has_many :arrangements
	has_many :user_orgs
	has_many :users, through: :user_orgs

	has_attached_file :avatar, :styles =>
	{ :medium => "300x300>", :thumb => "100x100>" },
	:default_url => "missingorg.png"
	validates_attachment_content_type :avatar,
	:content_type => /\Aimage\/.*\Z/
end
