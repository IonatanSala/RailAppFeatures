class SessionsController < ApplicationController
	def new
	end

	def create
		user = User.find_by(email: params[:session][:email])
		if user && user.authenticate(params[:session][:password])
			session[:user_id] = user.id
			flash[:notice] = "User has logged in"
			redirect_to root_path
		else
			flash.now[:notice] = "Password or email doesn't exist"
			render 'new'
		end
	end

	def destroy
		session[:user_id] = nil
		flash[:notice] = "Succesfully logged out"
		redirect_to root_path
	end
end
