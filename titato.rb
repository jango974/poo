require 'colorize'
class Board
  attr_accessor :board
  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def look_board
  puts
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  puts
  end

  def play(board)
    if @board[board[2]] == " "
      if board[1] == 'X'.red
        @board[board[2]] << 'X'.red
      else
        @board[board[2]] << 'O'.blue
      end
   
    end
  end

  def victory?
    case
    when @board[0] == @board[1] && @board[0] == @board[2] && @board[0] != " "
      return true
    when @board[3] == @board[4] && @board[3] == @board[5] && @board[3] != " "
      return true
    when @board[6] == @board[7] && @board[6] == @board[8] && @board[6] != " "
      return true
    when @board[0] == @board[3] && @board[0] == @board[6] && @board[0] != " "
      return true
    when @board[2] == @board[5] && @board[2] == @board[8] && @board[2] != " "
      return true
    when @board[0] == @board[4] && @board[0] == @board[8] && @board[0] != " "
      return true
    when @board[2] == @board[4] && @board[2] == @board[6] && @board[2] != " "
      return true
    when @board[1] == @board[4] && @board[1] == @board[7] && @board[1] != " "
      return true
    else
      return false
    end
  end
end

class Player
  attr_accessor :name, :player_choice
  def initialize(name, player_choice)
    @name = name
    @player_choice = player_choice
  end
end


class Game
  def initialize
    p "joueur 1 quel est ton blase ?"
    name_player1 = gets.chomp
    p "#{name_player1} vous etes les 'X' "
    player_choice1 = 'X'.red
    @player1 = Player.new(name_player1, player_choice1)
    p 'joueur 2 quel est ton blase ?'
    name_player2 = gets.chomp
    p "#{name_player2} vous etes les 'O'"
    player_choice2 = 'O'.blue
    @player2 = Player.new(name_player2, player_choice2)
    @players = [@player1, @player2]
    @actual_board = Board.new
    turns = 0
  end

  def go
    puts
    puts 'Regles'
    puts 'indique un numero'
    puts
    puts "  1 | 2 | 3 "
    puts "-------------"
    puts "  4 | 5 | 6 "
    puts "-------------"
    puts "  7 | 8 | 9 "
    puts
    self.turn
  end
  def turn
    turns = 0
    while   @actual_board.victory? == false do
      @players.each{ |player|
      @actual_board.look_board
      p " #{turns + 1}e coup"
      p "#{player.name} choisis une case "
      @case = gets.chomp.to_i
         
    until @case.positive? && @case < 10
      puts 'erreur'
      puts 'Choisis une nouvelle case'
      @case= gets.chomp.to_i
    end
      @case -= 1
      @resume = [player.name, player.player_choice, @case]
      @actual_board.play(@resume)

    if @actual_board.victory?
      @actual_board.look_board
      puts
      puts "  #{player.name},gagne!    "
      puts 'rejouer?'
      puts '(Y/N)'
      puts
      answer = gets.chomp.to_s.capitalize
      if answer == 'Y'
        Game.new.go
      else
        puts 'bye'
      end
      break
    end

      turns += 1

    if turns == 9
      @actual_board.look_board
      puts
      puts 'aucun gagnant'
      puts 'rejouer?'
      puts '(Y/N)'
      puts
      answer = gets.chomp.to_s.capitalize
      if answer == 'Y'
        Game.new.go
      else
        puts 'bye'
      end
      break
    end
      }
    end
  end
end

Game.new.go
