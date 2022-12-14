class ApplicationController < ActionController::API
	include ActionController::Cookies
	before_action :authorized
	rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable

	private

	def authorized
		@user = User.find_by(id: session[:user_id])
		render json: {errors: ["Not authorized"]}, status: :unauthorized unless session.include? :user_id
	end

	def render_unprocessable(invalid)
		render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
	end
end
