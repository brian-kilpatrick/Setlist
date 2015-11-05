class Song < ActiveRecord::Base
  belongs_to :organization	
  has_many :arrangements
  acts_as_taggable
end
