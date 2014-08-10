require './lib/comic_collection.rb'
require './lib/comic.rb'

@all_comics = []

def main_menu
  loop do
    puts "Press 'v' to view all comics in your collection"
    puts "Press 'l' to view your collections" 
    puts "Press '$' to see the total worth of your collection"
    puts "Press 'a' to add a comic."
    puts "Press 'c' to add a collection"
    puts "Press 'x' to exit the system"
    
    user_input = gets.chomp.downcase
    
    if user_input == 'v'
      view_comics
    elsif user_input == 'l'
      view_collection
    elsif user_input == '$'
      show_me_the_money
    elsif user_input == 'a'
      add_comic_book
    elsif user_input == 'c'
      add_collection
    elsif user_input == 'x'
      puts "Goodbye"
      exit
    else
      puts "That choice was invalid"
    end
  end
end

def add_collection
  puts "Please enter a collection name"
  name = gets.chomp
  Comic_collection.new(name).save
  @all_comics << Comic_collection.new(name)
  puts "Collection added"
end

def view_comics
  if @all_comics == []
    puts "\n\n\n\n"
    puts "You have no comics at this time"
  else
    @all_comics.each do |collection|
      collection.comics.each do |issue|
        puts issue.title
        puts issue.issue_num
      end
    end
  end
  main_menu
end

def add_comic_book
  if @all_comics == []
    add_collection
  else
    @all_comics.each do |index| 
      puts index.publisher
    end
    puts "Please select one"
    user_reply = gets.chomp
    @all_comics.each do |collection|
      if user_reply == collection.publisher
        puts "Please enter a title"
        title = gets.chomp
        puts "What is the issue number"
        number = gets.chomp
        puts "What does it value at?"
        value = gets.chomp
        puts "What condition grade is it?"
        grade = gets.chomp
        new_comic = Comic.new({'title'=> title, 'issue_num'=> number,  'worth'=>value,  'cgi'=>grade})
        collection.add_comic(new_comic)
      else
        puts "You have no collections to store your comics in please re-enter one now."
      end
    end
  end
end

def view_collection
  if @all_comics == []
    puts "You have no collections at this time"
    puts "\n\n\n\n\n"
  else
    @all_comics.each do |index|
    puts index.publisher
    end
  end
end
  
main_menu