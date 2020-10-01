require_relative './lib/player.rb'
require_relative './lib/board_game.rb'

def valid_sign?(input)
  input.length == 1
end

puts 'Enter Name:'
@name1 = gets.chomp
puts 'Enter Sign:'
@sign1 = gets.chomp

player1 = Player.new(@name1, @sign1)

puts 'Enter Name:'
@name2 = gets.chomp
if @name1 == @name2
  puts 'This name is already taken Enter another name.'
  @name2 = gets.chomp
end
puts 'Enter Sign:'
@sign2 = gets.chomp
if @sign1 == @sign2
  puts 'This sign is already taken Enter another sign for youself.'
  @sign2 = gets.chomp
end

player2 = Player.new(@name2, @sign2)
puts "Game started by #{player1.name} and #{player2.name}"

# game = TicTacToe.new(player1, player2)
# game.display_board
# game.play
