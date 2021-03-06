class FileAttachment < ActiveRecord::Base
  belongs_to :user
  has_attached_file :attachment_file
  validates_attachment_presence :attachment_file
end
