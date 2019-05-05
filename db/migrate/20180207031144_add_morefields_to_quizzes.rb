class AddMorefieldsToQuizzes < ActiveRecord::Migration
  def change
  	add_column :quizzes, :distract11, :varchar
  	add_column :quizzes, :distract12, :varchar
  	add_column :quizzes, :distract13, :varchar

	add_column :quizzes, :distract21, :varchar
  	add_column :quizzes, :distract22, :varchar
  	add_column :quizzes, :distract23, :varchar

	add_column :quizzes, :distract31, :varchar
  	add_column :quizzes, :distract32, :varchar
  	add_column :quizzes, :distract33, :varchar

	add_column :quizzes, :distract41, :varchar
  	add_column :quizzes, :distract42, :varchar
  	add_column :quizzes, :distract43, :varchar

  	add_column :quizzes, :distract51, :varchar
  	add_column :quizzes, :distract52, :varchar
  	add_column :quizzes, :distract53, :varchar

  end
end
