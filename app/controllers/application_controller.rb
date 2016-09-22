class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception

	def current_user
		User.find_by(id: session[:user_id])
	end

	def authenticate_user
		if current_user.present?
		else
			flash[:message] = "You must register or log in before you can do that! Fool!"
			redirect_to root_path
		end
	end

	helper_method :current_user
end
