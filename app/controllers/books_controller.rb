class BooksController < ApplicationController

    before_action :authenticate_user!

  def index
  	@newbook = Book.new
  	@books = Book.all
    @user = current_user
  end

  def show
    @book = Book.find(params[:id])
    @newbook = Book.new
    @user = User.find(@book.user_id)
  end

  def edit
    @book = Book.find(params[:id])
    @user = User.find(@book.user_id)
     if @user != current_user
      redirect_to books_path
     end
  end

  def create
  	@newbook = Book.new(book_params)
    @newbook.user_id = current_user.id
   if @newbook.save
    	redirect_to book_path(@newbook.id), notice: 'You have created book successfully.'
   else
      @books = Book.all
      @user = current_user
      render :index
   end
  end

  def update
    @book = Book.find(params[:id])
   if
    @book.update(book_params)
    redirect_to book_path(@book.id), notice: 'You have updated book successfully.'
   else
    render :edit
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
