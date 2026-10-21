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

