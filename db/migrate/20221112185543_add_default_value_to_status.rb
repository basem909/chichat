class AddDefaultValueToStatus < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :status, :integer, :default => 0
  end
end
