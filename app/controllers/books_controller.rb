class BooksController < ApplicationController
  before_action :set_book, only: [:destroy]
  before_action :set_author

  def create
    @book = Book.new(book_params)
    @book.author = @author

    respond_to do |format|
      if @book.save
        format.html { redirect_to @author, notice: 'Book created.' }
        format.json { render :show, status: :created, location: @author }
      else
        @books = @author.books
        format.html { render 'authors/show' }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @book.destroy

    respond_to do |format|
      format.html { redirect_to @author, notice: 'Book deleted.' }
      format.json { head :no_content }
    end
  end

  private
    def set_book
      @book = Book.find(params[:id])
    end

    def set_author
      @author = Author.find(params[:author_id])
    end

    def book_params
      params.require(:book).permit(:title)
    end
end
