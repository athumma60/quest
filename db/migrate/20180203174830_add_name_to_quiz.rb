class AddNameToQuiz < ActiveRecord::Migration
  def change
    add_column :quizzes, :name, :varchar
  end
end
