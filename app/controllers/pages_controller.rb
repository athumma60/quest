class PagesController < ApplicationController
  #Declares and initializes variables required for home page view
  def home
  	@quizzes = Quiz.all
  	allusers = Array.new
  	@allusers = User.order('score DESC')
  	@topusers = @allusers.limit(2)
  end
  #Declares and initializes variables required for index page view
  def index
    allusers = Array.new
    users = Array.new
    @users = User.all
    @allusers = User.order('score DESC')
  end

  private
  #Defines allowed quiz parameters
  def quiz_params
  	params.require{:quiz}.permit(:id)
  end
end
