class AddAnswersToUser < ActiveRecord::Migration
  def change
    add_column :users, :lastanswer1, :varchar
    add_column :users, :lastanswer2, :varchar
    add_column :users, :lastanswer3, :varchar
    add_column :users, :lastanswer4, :varchar
    add_column :users, :lastanswer5, :varchar
  end
end
