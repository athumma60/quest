class AddNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :varchar
  end
end
