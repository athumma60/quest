class UserController < ApplicationController

	#Creates a method to delete users
	def destroy
	  @user = User.find(params[:id])
	  @user.destroy
	  redirect_to admin_panel_users_path
	end

	#Creates a method for updating user information
	def update
	  @user = User.find(params[:id])
	  @cuser = current_user
	  @name = params[:name]	  
	  @email = params[:email]
	  @password = params[:password]
	  @prest = params[:prestige]
	  @prestige = @user.prestige

	  if @user.score > 100
        @prestige = @prestige + 1
        @score = @user.score
        @score = @score - 100
        @user.update_attributes(prestige: @prestige, score: @score)
      end

	  @user.update_attributes(name: @name, email: @email, password: @password)
	  @log = Log.new
	  @log.update_attributes(user: @user, userid: @user.id, updated_by: @cuser, event: "User Information Updated")
	  redirect_to user_path(@user)
	  flash[:success] = "User Information Updated"
	end

	#Declares and initializes required variables and contains logic for show user view
	def show
	  @user = User.find(params[:id])

	  allusers = Array.new
	  @allusers = User.order('score DESC')

	  if @allusers.length >= 1
	  @firstplace = @allusers[0]
	  end
	  if @allusers.length >= 2
	  @firstplace = @allusers[0]
	  @secondplace = @allusers[1]
	  end
	  if @allusers.length >= 3
	  @firstplace = @allusers[0]
	  @secondplace = @allusers[1]
	  @thirdplace = @allusers[2]
	  end


	end

	#Declares variables for edit user view
	def edit
	  @user = User.find(params[:id])
	  redirect_to root_path unless current_user.is_admin? or @user == current_user
	end

	#Creates a method for creating new users
	def new
      redirect_to root_path unless current_user.is_admin?
      @user = User.create!(:email => "test1234@gmail.com", :password => "test123")
      @cuser = current_user
      @log = Log.new
      @log.update_attributes(user: @user.email, userid: @user.id, updated_by: @cuser)
      redirect_to edit_user_path(@user)
    end

    private
    #Defines user parameters
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :name)
    end

end