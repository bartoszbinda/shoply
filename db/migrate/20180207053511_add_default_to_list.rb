class AddDefaultToList < ActiveRecord::Migration[5.0]
  def change
    change_column :lists, :status, :boolean, default: true
  end
end
