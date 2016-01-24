# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'

CSV.foreach("db/seeds/booksummaries.txt", { col_sep: "\t", quote_char: "\x00" }) do |row|
  if (not row[2].blank?) && (not row[3].blank?)
    Book.create!(title: row[2], summary: row[6], author: Author.find_or_create_by(name: row[3]))
    puts "Added: #{row[2]}, by #{row[3]}"
  end
end
