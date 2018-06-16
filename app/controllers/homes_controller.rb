class HomesController < ApplicationController
  def index
  	@user = User.all
  	@post_books = PostBook.all
  end

  def show
  end
end
