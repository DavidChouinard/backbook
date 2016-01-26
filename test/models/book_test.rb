require 'test_helper'

class BookTest < ActiveSupport::TestCase
  setup do
    @author = authors(:one)
  end

  test "should not save book without title" do
    book = Book.new(author: @author)
    assert_not book.save, "Created a book without a title"
  end

  test "should not save book without author" do
    book = Book.new(title: "Animal Farm")
    assert_not book.save, "Created a book without an author"
  end
end
