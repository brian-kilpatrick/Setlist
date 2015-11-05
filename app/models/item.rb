class Item < ActiveRecord::Base
  # join between Set Lists & Arrangements(songs)
  # default_scope :order => 'position'
  belongs_to :arrangement
  belongs_to :setlist
  acts_as_list scope: :setlist
end
