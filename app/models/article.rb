# frozen_string_literal: true

class Article < ActiveRecord::Base
  has_many :comments
  has_attached_file :image, styles: { medium: '300x300>', thumb: '100x100>' }
  has_attached_file :video
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  validates :title, presence: true, length: { minimum: 5, maximum: 200 }
  validates_with AttachmentSizeValidator, attributes: :image, less_than: 5.megabytes
  validates_with AttachmentSizeValidator, attributes: :video, less_than: 10.megabytes
end
