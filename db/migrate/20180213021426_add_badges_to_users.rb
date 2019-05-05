class AddBadgesToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :perfect_scores, :integer, :default => 0
  	add_column :users, :quizzes_taken, :integer, :default => 0
  end
end
