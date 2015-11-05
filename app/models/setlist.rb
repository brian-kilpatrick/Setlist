class Setlist < ActiveRecord::Base
  belongs_to :organization
  # join between Set Lists & Arrangements(songs)
  has_many :items, -> { order(position: :asc) }
  has_many :arrangements, through: :items
end
