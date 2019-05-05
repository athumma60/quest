class AdminController < ApplicationController
  before_action :authenticate_user!

  #Defines a method for admin_panel and declares and initializes required variables
  def admin_panel
  	redirect_to root_path unless current_user.is_admin?
  	@users = User.all
  	@quizzes = Quiz.all
    @logs = Log.all
  end

  #Defines a method for admin panel users and declares and initializes required variables
  def admin_panel_users
    redirect_to root_path unless current_user.is_admin?
    @users = User.all

    userResults = Array.new

    @q = User.ransack(params[:q])
    @usermatches = @q.result

    @userResults = @usermatches.to_a

  end

  #Defines a method for admin panel quizzes and declares and initializes required variables
  def admin_panel_quizzes
    arrResults = Array.new

    @q = Quiz.ransack(params[:q])
    @matches = @q.result

    @arrResults = @matches.to_a

    @quizzes = Quiz.all
  end

  #Defines a method for admin panel logs and declares and initializes required variables
  def admin_panel_logs
    @logs = Log.all
  end

end
