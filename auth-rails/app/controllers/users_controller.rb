class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			flash[:notice] = "Users created"
			session[:user_id] = @user.id
			redirect_to root_path
		else
			flash.now[:notice] = "Something went wrong in creating user"
			render 'new'
		end
	end

	private
	def user_params
		params.require(:user).permit(:username, :email, :password)
	end
end
