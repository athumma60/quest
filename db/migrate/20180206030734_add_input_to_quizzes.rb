class AddInputToQuizzes < ActiveRecord::Migration
  def change
  	add_column :quizzes, :input1, :varchar
    add_column :quizzes, :input2, :varchar
    add_column :quizzes, :input3, :varchar
    add_column :quizzes, :input4, :varchar
    add_column :quizzes, :input5, :varchar
  end
end
