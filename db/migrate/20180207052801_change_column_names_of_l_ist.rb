class ChangeColumnNamesOfLIst < ActiveRecord::Migration[5.0]
  def change
    rename_column :lists, :title, :name
    add_column :lists, :status, :bool, :default => false
    add_column :lists, :amount, :float
    change_table :lists do |t|
      t.change :name, :text
    end
  end
end
