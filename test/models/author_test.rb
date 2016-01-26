require 'test_helper'

class AuthorTest < ActiveSupport::TestCase
  test "should not save author without name" do
    author = Author.new
    assert_not author.save, "Created an author without a title"
  end
end
