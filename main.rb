require_relative './modules/app'
require 'colorize'

puts " \nWelcome to The Catalogue of Items 😎 !\n\n".colorize(:light_green)
sleep 0.5

def main
  app = App.new
  app.run
end

main
