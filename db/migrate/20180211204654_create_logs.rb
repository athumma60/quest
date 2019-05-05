 class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      

      t.integer :userid
      t.integer :quizid

      t.string :user
      t.string :quiz

      t.integer :score
      t.datetime :time_of_occurence

      t.string :event
      t.string :last_sign_in_ip

      t.timestamps null: false
    end
  end
end
