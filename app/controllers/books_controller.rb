class BooksController < ApplicationController
before_action :authenticate_user!,except: [:top]
	def top
	end

	def index
		@books = Book.all
		@book = Book.new
		@users = User.all
		@user = User.new
	end

	def new
		@book = Book.new
	end

	def show
		@book = Book.find(params[:id])
		@users = User.all
		@user = User.new
	end

	def create
		@book = Book.new(book_params)
		@book.user_id = current_user.id
        if @book.save
        flash[:notice] = "successfully"
        redirect_to book_path(@book)
        else
       @books = Book.all
       @user = current_user
       render 'books/index'
	    end
	end

	def edit
		@book = Book.find(params[:id])
		if current_user.id != @book.user.id
			redirect_to books_path
		end
	end

	def update
		@book = Book.find(params[:id])
	    if @book.update(book_params)
	    redirect_to book_path
        flash[:notice] = "successfully"
	    else
	    flash[:notice] = "error"
	    render "books/edit"
	    end
    end

	def destroy
     	book = Book.find(params[:id])
		book.destroy
		redirect_to books_path
	end

	private

	def book_params
		params.require(:book).permit(:title, :body)
	end
end