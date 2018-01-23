# frozen_string_literal: true

class AddAttachmentVideoToArticles < ActiveRecord::Migration
  def self.up
    change_table :articles do |t|
      t.attachment :video
    end
  end

  def self.down
    remove_attachment :articles, :video
  end
end
