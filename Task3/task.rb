class LibraryItem
  attr_reader :title, :author, :year

  def initialize(title, author, year)
    @title = title
    @author = author
    @year = year
  end

  def display_info
    puts "Title: #{@title}, Author: #{@author}, Year: #{@year}"
  end
end

