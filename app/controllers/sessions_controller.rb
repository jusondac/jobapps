class SessionsController < ApplicationController
	def create
		username = params[:username]
		password = params[:password]
		user = User.where("username  = ? ",username).first
		user_password = User.where("password = ? ",password).first
		if !user_password.blank? 
			session[:user] = user.id
			flash[:notice] = "Welcome #{user.username}"
			redirect_to root_url
		else
			params[:username]
			flash[:error] = "your data not valid"
			render 'new'
		end
	end

	def destroy
		session[:user] = nil
		flash[:notice] = "logout session success"
		redirect_to root_url
	end
end
