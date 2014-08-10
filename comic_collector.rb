require './lib/comic_collection.rb'
require './lib/comic.rb'

def main_menu
  loop do
    puts "Press 'v' to view all comics in your collection"
    puts "Press '$' to see the total worth of your collection"
    puts "Press 'a' to add a comic."
    puts "Press 'x' to exit the system"
    
    user_input = gets.chomp.downcase
    
    if user_input == 'v'
      view_comics
    elsif user_input == '$'
      show_me_the_money
    elsif user_input == 'a'
      add_comic
    elsif user_input == 'x'
      puts "Goodbye"
    else
      puts "That choice was invalid"
    end
  end
end

main_menu