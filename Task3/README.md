# Task 3 – Inheritance and Polymorphism in Ruby

## Introduction

This program is a small library system that shows inheritance and polymorphism in Ruby.

- **Inheritance** – `Book`, `DVD` and `CD` inherit from one parent class, `LibraryItem`, so they share `title`, `author` and `year`.
- **Polymorphism** – each class has its own `display_info`. The `Library` class calls `display_info` on any item without checking its type, and Ruby runs the right version for each object.

## How to run

Open a terminal in the `Task3` folder and run:

```bash
ruby task.rb
```

Output:

```
[Book] Title: Concepts of Programming Languages, Author: Robert Sebesta, Year: 2015
  Genre: Programming
[DVD] Title: Inception, Director: Christopher Nolan, Year: 2010
  Genre: Science Fiction
[CD] Title: A Day at the Races, Artist: Queen, Year: 1976
  Genre: Rock

--- Library ---
(the same three items again)
```

## How the file was written (step by step)

### Step 1 – LibraryItem class (commit `add LibraryItem class`)

First I wrote the parent class `LibraryItem` with `title`, `author`, `year` and a `display_info` method:

```ruby
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
```

### Step 2 – Book, DVD and CD classes (commit `add Book, DVD and CD classes`)

Next I added three child classes. Each one inherits from `LibraryItem` with `<`, adds a `genre`, and calls `super` in `initialize` to save the shared fields.

- `Book#display_info` calls `super`, so it **extends** the parent's method.
- `DVD#display_info` and `CD#display_info` do not call `super`, so they **replace** it and print `Director` / `Artist` instead of `Author`.

```ruby
def display_info
  print "[Book] "
  super
  puts "  Genre: #{@genre}"
end
```

### Step 3 – Library class (commit `add Library class`)

Then I added `Library`, which keeps items in an array and can add, remove and display them:

```ruby
def display_item(item)
  item.display_info
end
```

`display_item` does not know if the item is a `Book`, `DVD` or `CD`. It just calls `display_info`.

### Step 4 – Test (commit `add test for creating items and displaying them through library`)

Last I created one `Book`, one `DVD` and one `CD`, printed them directly, then added them to a `Library` and printed them again with `display_all_items`.

## Explaining the results

| Call | Output starts with | Why |
|---|---|---|
| `book.display_info` | `[Book] Title: ..., Author: ...` | `Book` calls `super`, so the parent's line is printed too. |
| `dvd.display_info` | `[DVD] Title: ..., Director: ...` | `DVD` replaces the method completely. |
| `cd.display_info` | `[CD] Title: ..., Artist: ...` | `CD` replaces the method completely. |
| `library.display_all_items` | same three outputs | Ruby picks the method of the real object. |

So:

- The output through the library is the **same** as calling each object directly. This is **polymorphism** (dynamic binding).
- Unlike C# (Task 2), Ruby has no `virtual` or `override`. A method in a child class with the same name always replaces the parent's one.
