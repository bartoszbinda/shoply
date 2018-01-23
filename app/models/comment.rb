# frozen_string_literal: true

class Comment < ActiveRecord::Base
  belongs_to :article
  validates :commenter, presence: true, length: { minimum: 3, maximum: 60 }
  validates :body, presence: true, length: { minimum: 3, maximum: 300 }
end
