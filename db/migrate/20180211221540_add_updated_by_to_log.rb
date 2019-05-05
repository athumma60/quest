class AddUpdatedByToLog < ActiveRecord::Migration
  def change
  	add_column :logs, :updated_by, :varchar
  end
end
