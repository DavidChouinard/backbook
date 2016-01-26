require 'test_helper'

class AuthorsControllerTest < ActionController::TestCase
  setup do
    @author = authors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success, "Author index returns HTTP failure"
    assert_not_nil assigns(:authors), "Author index does not set `authors` variable"
  end

  test "should create author" do
    assert_difference('Author.count', 1, "Does not create an author") do
      post :create, author: { name: @author.name }
    end

    assert_redirected_to author_path(assigns(:author)), "Does not redirect to author page after author creation"
  end

  test "should show author" do
    get :show, id: @author
    assert_response :success, "Author page returns HTTP failure"
    assert_not_nil assigns(:books), "Author page does not set `books` variable"
  end

  test "should update author" do
    patch :update, id: @author, author: { name: @author.name }
    assert_redirected_to author_path(assigns(:author)), "Does not redirect to author page after author update"
  end

  test "should destroy author" do
    assert_difference('Author.count', -1, "Does not delete author") do
      delete :destroy, id: @author
    end

    assert_redirected_to authors_path, "Does not redirect to author page after author delete"
  end
end
