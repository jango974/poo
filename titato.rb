require 'pry'


class BoardCase
  attr_accessor :status

  def initialize
    @status = ' '
  end

  def to_s
    @status
  end
end


class Board
  attr_accessor :board
  
    def initialize
    @board = [" ", " ", " ", " ", " ", " ", " "," ", " ", " "]
    return
    end

    def look_board

    puts " 0#{@board[0]} | 1#{@board[1]} | 2#{@board[2]}  "
    puts "-----------"
    puts " 3#{@board[3]} | 4#{@board[4]} | 5#{@board[5]}  "
    puts "-----------"
    puts " 6#{@board[6]} | 7#{@board[7]} | 8#{@board[8]}  "
    return
   end
   
end
 
def play
    if @board[1] == " "
      if @board[0] == "O"
        @board[1] << "O"
      else
        @board[0] << "X"
      end
      return
    
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
    return 
end

end

class Player

  attr_accessor :name, :player_choice
    def initialize(name, player_choice)
    @name = name
    @player_choice = player_choice
    return
    end

end

class Game
	attr_accessor :board
	def initialize
    p "joueur 1 quel est ton blase ?"
    name_player1 = gets.chomp
    p "#{name_player1} vous etes les 'O' "
    player_choice1= "O"
    @player1 = Player.new(name_player1, player_choice1)
    p "joueur 2 quel est ton blase? "
    name_player2 = gets.chomp
    p "#{name_player2} vous etes les 'X' "
    player_choice2 = "X"
    @player2 = Player.new(name_player2, player_choice2)
    @all_players = [@player1, @player2]
    @new_board = Board.new
return
end
    puts "\n >> règle << \n"
    puts "choisis une case \n " 
    puts "  0 | 1 | 2 "
    puts "------------"
    puts "  3 | 4 | 5 "
    puts "------------"
    puts "  6 | 7 | 8 "
    puts 
    puts " début du jeu, preparez vous! "
    

    def go 
b = Board.play
B.play
    return
    end

   def turn
      turns = 0
    while @new_board.victory? == false do 
      @all_players.each{ |player| }
        @new_board.look_board
        puts " > #{turns + 1}e coup <"
        puts "#{player.name} ! choisis une case"   
    
     
    n = gets.chomp.to_i
    
    end
    
    @resume = [player.name, player.player_choice, n]
@new_board.play(@resume)
turns +=1


        if @new_board.victory?
          @new_board.look_board
          puts "       #{player.name},you win!! !  "
          puts "rejouer? (Y/N)"
          choice = gets.chomp
          if choice == "Y"
            Game.new.go
          else
            puts "bye"
          end
          
        end

      if turns == 9 
        @new_board.look_board
        puts "  > Match nul < "
        puts "rejouer?(Y/N)"
        choice = gets.chomp
        if choice == "Y"
          Game.new.go
        else
          puts "bye"
        end
       
      end
     
    end 
end

Game.new.go

