class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	has_many :posts
	has_many :user_orgs
	has_many :organizations, through: :user_orgs

	has_attached_file :avatar, :styles =>
	{ :medium => "300x300>", :thumb => "100x100>" },
	:default_url => "missinguser.png"
	validates_attachment_content_type :avatar,
	:content_type => /\Aimage\/.*\Z/
end
