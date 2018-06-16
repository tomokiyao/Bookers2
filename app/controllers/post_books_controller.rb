class PostBooksController < ApplicationController
	before_action :authenticate_user!
  def new
  	@post_books = PostBook.new
  end

  def create
  	@post_book = PostBook.new(post_book_params)
  	@post_book.user_id = current_user.id
  	if @post_book.save
  	redirect_to post_book_path(@post_book.id)
  	else
  		redirect_to post_books_path
  	end
  end

  def index
  	@post_books = PostBook.all
  	@user = current_user
  	@post_book = PostBook.new

  end

  def show
  	@post_book = PostBook.find(params[:id])
  	@user = current_user
  	@post_books = PostBook.new
  end

  def edit
  	@post_book = PostBook.find(params[:id])
  	@user = User.all
  	if @post_book.user != current_user
  		redirect_to post_books_path
  	end
  end

  def update
  	post_book = PostBook.find(params[:id])
  	post_book.update(post_book_params)
  	redirect_to post_book_path
  end

  def destroy
  	post_book = PostBook.find(params[:id])
  	post_book.destroy
  	redirect_to post_books_index_path
  end

  private
      def post_book_params
        params.require(:post_book).permit(:book_name, :image, :caption, :user_id )
    end

end
