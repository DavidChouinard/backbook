require 'test_helper'

class BooksControllerTest < ActionController::TestCase
  setup do
    @book = books(:one)
    @author = authors(:one)
  end

  test "should create book" do
    assert_difference('Book.count', 1, "Does not create a book") do
      post :create, book: { title: @book.title }, author_id: @author
    end

    assert_redirected_to author_path(assigns(:author)), "Does not redirect to author page after book creation"
  end

  test "should destroy book" do
    assert_difference('Book.count', -1, "Does not delete book") do
      delete :destroy, id: @book, author_id: @author
    end

    assert_redirected_to author_path(assigns(:author)), "Does not redirect to author page after book delete"
  end
end
