class Arrangement < ActiveRecord::Base
  belongs_to :song
  belongs_to :organization
  has_many :attachments		
  # join between Set Lists & Arrangements(songs)
  has_many :items
  has_many :setlists, through: :items
end
