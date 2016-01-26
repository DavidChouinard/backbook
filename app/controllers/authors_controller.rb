class AuthorsController < ApplicationController
  before_action :set_author, only: [:show, :edit, :update, :destroy]
  before_action :get_books, only: [:show, :update]

  def index
    @authors = Author.order(:name)
    @author = Author.new
  end

  def show
  end

  def create
    @author = Author.new(author_params)

    respond_to do |format|
      if @author.save
        format.html { redirect_to @author, notice: 'Author created.' }
        format.json { render :show, status: :created, location: @author }
      else
        format.html { render :show }
        format.json { render json: @author.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @author.update(author_params)
        format.html { redirect_to @author, notice: 'Author updated.' }
        format.json { render :show, status: :ok, location: @author }
      else
        format.html { render :show }
        format.json { render json: @author.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @author.destroy
    respond_to do |format|
      format.html { redirect_to authors_url, notice: 'Author deleted.' }
      format.json { head :no_content }
    end
  end

  private
    def set_author
      @author = Author.find(params[:id])
    end

    def get_books
      @books = @author.books
      @book = Book.new(author: @author)
    end

    def author_params
      params.require(:author).permit(:name)
    end
end
