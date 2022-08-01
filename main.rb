#!/usr/bin/env ruby
puts "\nWelcome to my catalogue of things...\n"
def options_list
  puts "Please select an option by number:
            1. List All Books
            2. List All Music Albums
            3. List Of Games
            4. List All Labels
            5. List All Authors
            6. List All Sources
            7. Add A Book
            8. Add A Music Album
            9. Add A Game
            10. Exit
            "
  gets.chomp.to_i
end

def home_options
  case options_list
  when 1
    hjkshjk
  when 2
    jsadfhaw
  when 3
    jawhdiaj
  when 4
    kjfbs
  when 5
    whda
  when 6
    djshb
  when 7
    jdhaus
  when 8
    jhdsiu
  when 9
    iuwhd
  when 10
    puts "\nThank you for visiting my catalogue. See you next time...\n"
    exit
  else
    puts "\nPlease choose an option from the list\n"
  end
  home_options
end

def main
  home_options
end

main
