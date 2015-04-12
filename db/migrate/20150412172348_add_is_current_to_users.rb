class AddIsCurrentToUsers < ActiveRecord::Migration
  def change
    add_column :users, :is_current, :boolean, default: false
  end
end
