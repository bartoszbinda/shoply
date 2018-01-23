# frozen_string_literal: true

class AddNickToUsertAble < ActiveRecord::Migration
  def change
    add_column :users, :nick, :string
  end
end
