class Attachment < ActiveRecord::Base
  belongs_to :arrangement
  belongs_to :post
  has_attached_file :file 
  validates_attachment_content_type :avatar, :content_type => /.*/
  alidates_with AttachmentSizeValidator, attributes: :file, less_than: 25.megabytes
end
