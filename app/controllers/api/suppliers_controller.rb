class Api::SuppliersController < ApplicationController
	def index
		render json: Supplier.all, status: :ok
	end

	def show
		sup = find_sup
		render json: sup, status: :ok
	end

	def create
		sup = Supplier.create!(supplier_params)
		render json: sup, status: :created
	end

	def update
		sup = find_sup
		sup.update!(supplier_params)
		render json: sup, status: :accepted
	end

	def destroy
		sup = find_sup
		sup.destroy
		render json: {}, status: :accepted
	end

	private
	def find_sup
		Supplier.find(params[:id])
	end

	def supplier_params
		params.permit(:name, :image, :location, :schedule, :user_id)
	end
end
