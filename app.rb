require_relative 'class/item'
require_relative 'class/movie'
require_relative 'class/source'
require_relative 'class/music_album'
require_relative 'class/genre'
require_relative 'class/label'
require_relative 'class/book'
require_relative 'class/book_helper'
require 'json'
require 'date'
class App
  def initialize
    @items = []
    @labels = []
    @books = []
    load_Books
    load_labels
  end

  def add_book
    puts 'Add Book Information'
    puts 'Enter Publisher'
    publisher_name = gets.chomp
    puts 'Enter Cover State of the book (true or false)'
    cover_state = gets.chomp.downcase == 'true'
    puts 'Enter Publish date (YYYY-MM-DD)'
    publish_date = gets.chomp
    # Display the list of existing labels with numbers
    puts 'Existing Labels:'
    @labels.each_with_index do |label, index|
      puts "#{index + 1}. Title: #{label.title}, Color: #{label.color}"
    end

    # select a label by entering the corresponding number
    puts 'Select a label by entering the label number (or enter 0 to create a new label):'
    selection = gets.chomp.to_i

    if selection.zero?
      selected_label = add_label
    elsif selection.positive? && selection <= @labels.length
      selected_label = @labels[selection - 1]
    else
      puts 'Invalid label selection.'
      return
    end
    # Book object after collecting all information
    book_data = Book.new(publish_date, publisher_name, cover_state)
    selected_label.add_item(book_data)
    @books << book_data
    puts 'You have successfully added a new book!'
  end

  def add_label
    puts 'Enter the new label title:'
    title = gets.chomp
    puts 'Enter the new label color:'
    color = gets.chomp
    label = @labels.find { |item| item.title == title && item.color == color }
    unless label
      label = Label.new(title, color)
      @labels << label
    end
    label
  end

  def list_Book
    @books.each do |book|
      puts "title:#{book.label.title}, Publisher: #{book.publisher}, Published: #{book.publish_date}, Archived: #{book.archived}"
    end
  end

  def list_Label
    @labels.each do |label|
      puts "#{label.id}. title: #{label.title} (Color: #{label.color})"
    end
  end

  def display_menu
    puts '------------------------------------------------------'
    puts 'Welcome to the Catalog of My Things!'
    puts '------------------------------------------------------'
    puts '1 - List all books'
    puts '2 - List all music albums'
    puts '3 - List all movies'
    puts '4 - List of games'
    puts "5 - List all genres (e.g 'Comedy', 'Thriller')"
    puts "6 - List all labels (e.g. 'Gift', 'New')"
    puts "7 - List all authors (e.g. 'Stephen King')"
    puts "8 - List all sources (e.g. 'From a friend', 'Online shop')"
    puts '9 - Add a book'
    puts '10 - Add a music album'
    puts '11 - Add a movie'
    puts '12 - Add a game'
    puts '13 - Add a genre'
    puts '14 - Add a label'
    puts '15 - Add a author'
    puts '16 - Add a source'
    puts '17 - Exit'
  end

  def startApplication
    loop do
      display_menu
      option = gets.chomp.to_i
      case option
      when 1
        list_Book
      when 2
      # List All Music Albums
      when 3
      # List All Movies
      when 4
      # your code here
      when 5
      # List All Genre
      when 6
        list_Label
      when 7
      # your code here
      when 8
      # List All Sources

      when 9
        add_book
      when 10
        list_Label
      when 11
      # Add A Movie

      when 12
      # your code here
      when 13
      # Add Music_album genre
      when 14
        add_label
      when 15
      # your code here
      when 16
      # Add Movie Source
      when 17
        save_Books
        save_Labels
        puts 'Thank You for using this Application'
        break
      else
        puts 'Invalid Option, please choose from 1-10'
      end
    end
  end
end
