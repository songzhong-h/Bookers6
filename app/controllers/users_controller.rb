class UsersController < ApplicationController
	before_action :authenticate_user!
	def index
		@books = Book.all
		@book = Book.new
		@users = User.all
		@user = current_user
	end

	def new
	end

	def show
		@book = Book.new
		@user = User.find(params[:id])
		@books = @user.books
	end

	def edit
		@user = User.find(params[:id])
		if current_user.id != @user.id
			redirect_to user_path(current_user)
		end
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			flash[:notice] = "successfully"
			redirect_to user_path
		else
			flash[:notice] = "error"
			render "users/edit"
		end
	end

	def destroy
	end

	private

	def user_params
		params.require(:user).permit(:profile_image, :name, :introduction)
	end
end
