class Song < ActiveRecord::Base
  belongs_to :organization	
  has_many :arrangements
  acts_as_taggable

  accepts_nested_attributes_for :arrangements
  # set up nested validations, validation for "Default Arr" if its the first one
  # validates_associated
end
