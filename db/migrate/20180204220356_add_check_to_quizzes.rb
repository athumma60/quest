class AddCheckToQuizzes < ActiveRecord::Migration
  def change
    add_column :quizzes, :check1, :varchar
    add_column :quizzes, :check2, :varchar
    add_column :quizzes, :check3, :varchar
    add_column :quizzes, :check4, :varchar
    add_column :quizzes, :check5, :varchar
  end
end
