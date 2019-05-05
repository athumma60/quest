class QuizController < ApplicationController
	before_action :authenticate_user!
  #Declares variables and logic required for updating quizzes
  def update
  	@answer1 = params[:input1]
  	@answer2 = params[:input2]
  	@answer3 = params[:input3]
  	@answer4 = params[:input4]
  	@answer5 = params[:input5]

  	@user = current_user
  	@score = @user.score
  	@quizscore = 0
  	@quiz = Quiz.find(params[:id])
    @perfects = 0
    @quiztotal = @user.quizzes_taken + 1
  	

    if @quiz.check1 == @quiz.answer1
      @score = @score + 1 
      @quizscore = @quizscore + 1
    end
    if @quiz.check2 == @quiz.answer2
      @score = @score + 1
      @quizscore = @quizscore + 1
    end
    if @quiz.check3 == @quiz.answer3
      @score = @score + 1
      @quizscore = @quizscore + 1
    end
    if @quiz.check4 == @quiz.answer4
      @score = @score + 1
      @quizscore = @quizscore + 1
    end
    if @quiz.check5 == @quiz.answer5
      @score = @score + 1
      @quizscore = @quizscore + 1
    end

    if @quizscore == 5
      @perfects = @perfects + 1
      @user.update_attributes(perfect_scores: @perfects)
    end
    
    #Allows users to submit their quizzes for gradsing and logs the event
    if current_user.is_admin != true   
     @log = Log.new
     @log.update_attributes(score: @quizscore, userid: @user.id, quizid: @quiz.id, user: @user.email,
      quiz: @quiz.name, last_sign_in_ip: @user.current_sign_in_ip, event: "Quiz Taken") 	
     @user.update_attributes(score: @score, quizzes_taken: @quiztotal)

     if @quiz.update_attributes(check1: @answer1, check2: @answer2, check3: @answer3, check4: @answer4, check5: @answer5)
      redirect_to root_path
      flash[:success] = "You got " + @quizscore.to_s + "/5 correct!"
     end
    end

    
    if current_user.is_admin?
      #Declares required variables for admins to update quizzes
    @name = params[:name]
    @question1 = params[:question1]
    @question2 = params[:question2]
    @question3 = params[:question3]
    @question4 = params[:question4]
    @question5 = params[:question5]
    @ans1 = params[:answer1]
    @ans2 = params[:answer2]
    @ans3 = params[:answer3]
    @ans4 = params[:answer4]
    @ans5 = params[:answer5]
    @dis11 = params[:distract11]
    @dis12 = params[:distract12]
    @dis13 = params[:distract13]
    @dis21 = params[:distract21] 
    @dis22 = params[:distract22]
    @dis23 = params[:distract23]
    @dis31 = params[:distract31]
    @dis32 = params[:distract32]
    @dis33 = params[:distract33]
    @dis41 = params[:distract41]
    @dis42 = params[:distract42]
    @dis43 = params[:distract43]
    @dis51 = params[:distract51]
    @dis52 = params[:distract52]
    @dis53 = params[:distract53]

      #Updates quiz parameters for new questions answers and distractors
      @quiz.update_attributes(name: @name, question1: @question1, question2: @question2, question3: @question3, question4: @question4,
        question5: @question5, answer1: @ans1, answer2: @ans2, answer3: @ans3, answer4: @ans3, answer5: @ans5, distract11: @dis11, distract12: @dis12,
         distract13: @dis13, distract21: @dis21, distract22: @dis22, distract23: @dis23, distract31: @dis31, distract32: @dis32, distract33: @dis33,
          distract41: @dis41, distract42: @dis42, distract43: @dis43, distract51: @dis51, distract52: @dis52, distract53: @dis53)

      @log = Log.new
      @log.update_attributes(updated_by: @user.email, quizid: @quiz.id, event: "Quiz Updated", 
        last_sign_in_ip: @user.current_sign_in_ip)

        redirect_to admin_panel_quizzes_path
      
    
      end
  end

  #Declares neccessary variables needed for the edit quiz form
  def edit  
    redirect_to root_path unless current_user.is_admin?
  	@quiz = Quiz.find(params[:id])  
  end

  #Declares variables needed for the quiz index view
  def index
    arrResults = Array.new

    @q = Quiz.ransack(params[:q])
    @matches = @q.result

    @arrResults = @matches.to_a

  	@quizzes = Quiz.all
    allusers = Array.new
    topusers = Array.new
    @allusers = User.order('score DESC')
    @topusers = @allusers.limit(5)
  end

  #Finds the quiz needed to be displayed in quiz show view
  def show
  	@quiz = Quiz.find(params[:id])
  end

  #Creates a method for deleting quizzes
  def destroy
    @quiz = Quiz.find(params[:id])
    @quiz.destroy
    redirect_to admin_panel_quizzes_path
  end

  #Creates a method for creating new quizzes and restricting it only to admins
  def new
    redirect_to root_path unless current_user.is_admin?
    @user = current_user
    @quiz = Quiz.create!
    @log = Log.new
    @log.update_attributes(userid: @user.id, user: @user.email, event: "Quiz Created")
    redirect_to edit_quiz_path(@quiz)
  end

  private
  #Defines quiz parameters
  def quiz_params
  	params.require(:quiz).permit(:id, :question1, :question2, :question3, :question4, :question5, :answer1, :answer2,
  		:answer3, :answer4, :answer5, :check1, :check2, :check3, :check4, :check5, :input1, :input2, :input3, :input4,
       :input5, :name, :distract11, :distract12, :distract13, :distract21, :distract22, :distract23, :distract31, 
       :distract32, :distract33, :distract41, :distract42, :distract43, :distract51, :distract52, :distract53)
  end

end
