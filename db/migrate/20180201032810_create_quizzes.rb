class CreateQuizzes < ActiveRecord::Migration
  def change
    create_table :quizzes do |t|
    	
      t.text :question1
      t.text :answer1

      t.text :question2
      t.text :answer2

      t.text :question3
      t.text :answer3

      t.text :question4
      t.text :answer4

      t.text :question5
      t.text :answer5

      t.timestamps null: false
    end
  end
end
