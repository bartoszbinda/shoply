# frozen_string_literal: true

class AddIsBannedToUsers < ActiveRecord::Migration
  def change
    add_column :users, :isBanned, :boolean, default: false
  end
end
