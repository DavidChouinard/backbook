class Book < ActiveRecord::Base
  belongs_to :author

  validates :author, :presence => true
  validates :title, presence: true
end
