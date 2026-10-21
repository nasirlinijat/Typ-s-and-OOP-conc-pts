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

class Book < LibraryItem
  attr_reader :genre

  def initialize(title, author, year, genre)
    super(title, author, year)
    @genre = genre
  end

  def display_info
    print "[Book] "
    super
    puts "  Genre: #{@genre}"
  end
end

class DVD < LibraryItem
  attr_reader :genre

  def initialize(title, director, year, genre)
    super(title, director, year)
    @genre = genre
  end

  def display_info
    print "[DVD] "
    puts "Title: #{@title}, Director: #{@author}, Year: #{@year}"
    puts "  Genre: #{@genre}"
  end
end

class CD < LibraryItem
  attr_reader :genre

  def initialize(title, artist, year, genre)
    super(title, artist, year)
    @genre = genre
  end

  def display_info
    print "[CD] "
    puts "Title: #{@title}, Artist: #{@author}, Year: #{@year}"
    puts "  Genre: #{@genre}"
  end
end

class Library
  def initialize
    @items = []
  end

  def add_item(item)
    @items << item
  end

  def remove_item(item)
    @items.delete(item)
  end

  def display_item(item)
    item.display_info
  end

  def display_all_items
    @items.each { |item| display_item(item) }
  end
end

book = Book.new("Concepts of Programming Languages", "Robert Sebesta", 2015, "Programming")
dvd  = DVD.new("Inception", "Christopher Nolan", 2010, "Science Fiction")
cd   = CD.new("A Day at the Races", "Queen", 1976, "Rock")

book.display_info
dvd.display_info
cd.display_info

puts "\n--- Library ---"
library = Library.new
library.add_item(book)
library.add_item(dvd)
library.add_item(cd)
library.display_all_items
