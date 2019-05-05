 class AddPrestigeToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :prestige, :integer, :default => 0
  end
end
