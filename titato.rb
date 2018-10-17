# frozen_string_literal: true                  #methode de la team

require 'colorize'

# class Player
# Est appele 2 fois pour enregistrer les joueurs
class Player
  attr_accessor :firstname

  def initialize(firstname)
    @firstname = firstname
  end

  def name
    @firstname.to_s.capitalize
  end
end

# Class Board
# Initialise le tableau a 0(vide)
class Board
  attr_accessor :tab

  def initialize
    @tab = []
    @tab = [' ', ' ', ' ',     #  1 | 2 | 3
            ' ', ' ', ' ',     #  4 | 5 | 6
            ' ', ' ', ' ']     #  7 | 8 | 9
  end

  def base_board
    @tab
  end
end

# class Boardase
# Remplie le tableau a chaque appel (lorsque le joueur a choisi sa case)
class BoardCase
  attr_accessor :tab, :chosen_case, :symbol, :count

  def initialize(tab, chosen_case, symbol, count)
    @tab = tab
    @chosen_case = chosen_case
    @symbol = symbol
    @count = count
  end

  def board_update
    system 'clear'
    if @tab[@chosen_case - 1] == ' '
      @tab[@chosen_case - 1] = @symbol
      x = 0
      y = 0
      while @tab[x]
        if [1, 3, 6, 8, 11, 13].include?(y)
          print '|'
        elsif [2, 5].include?(x)
          print " #{@tab[x]} "
          print "\n-----------\n"
          x += 1
        else
          print " #{@tab[x]} "
          x += 1
        end
        y += 1
      end
      print "\n"
    else
      puts 'Case occupée !'
      sleep(1)
      @count -= 1
    end
    return @tab, @count
  end
end

# Class Verification
# Verifie si le jeu trouve un gagnant ou une egalite
class Verification
  attr_accessor :tab, :count

  def initialize(tab, count)
    @tab = tab
    @count = count
  end

  def is_finished
    joueur = 0
    if tab[0] == 'x'.red && tab[1] == 'x'.red && tab[2] == 'x'.red || tab[3] == 'x'.red && tab[4] == 'x'.red && tab[5] == 'x'.red || tab[6] == 'x'.red && tab[7] == 'x'.red && tab[8] == 'x'.red || tab[0] == 'x'.red && tab[3] == 'x'.red && tab[6] == 'x'.red || tab[1] == 'x'.red && tab[4] == 'x'.red && tab[7] == 'x'.red || tab[2] == 'x'.red && tab[5] == 'x'.red && tab[8] == 'x'.red || tab[0] == 'x'.red && tab[4] == 'x'.red && tab[8] == 'x'.red || tab[2] == 'x'.red && tab[4] == 'x'.red && tab[6] == 'x'.red
      return 1
    elsif tab[0] == 'o'.blue && tab[1] == 'o'.blue && tab[2] == 'o'.blue || tab[3] == 'o'.blue && tab[4] == 'o'.blue && tab[5] == 'o'.blue || tab[6] == 'o'.blue && tab[7] == 'o'.blue && tab[8] == 'o'.blue || tab[0] == 'o'.blue && tab[3] == 'o'.blue && tab[6] == 'o'.blue || tab[1] == 'o'.blue && tab[4] == 'o'.blue && tab[7] == 'o'.blue || tab[2] == 'o'.blue && tab[5] == 'o'.blue && tab[8] == 'o'.blue || tab[0] == 'o'.blue && tab[4] == 'o'.blue && tab[8] == 'o'.blue || tab[2] == 'o'.blue && tab[4] == 'o'.blue && tab[6] == 'o'.blue
      return 2
    elsif count == 8
      return 3
    else
      return joueur
    end
  end
end

system 'clear'

puts 'Nom du 1er joueur :'
player1 = Player.new(gets.chomp)
player1 = player1.name

puts 'Nom du 2eme joueur :'
player2 = Player.new(gets.chomp)
player2 = player2.name

print "\n"

game = Board.new
game = game.base_board
count = 0
help = true
verif = true
continue = true
game_num = 1

while continue == true
  puts "Partie n°#{game_num}"
  while verif == true && count <= 9
    if help == true
      puts '/!\\ Attention /!\\'
      puts 'Voici une aide pour le choix des cases :'
      puts "1 | 2 | 3\n---------\n4 | 5 | 6\n---------\n7 | 8 | 9"
      help = false
    end
    puts 'Choisir une case entre 1 et 9 :'
    choice = gets.chomp.to_i
    if choice <= 9 && choice.positive?
      if (count % 2).zero? && count != 1
        game, count = BoardCase.new(game, choice, 'x'.red, count)
      else
        game, count = BoardCase.new(game, choice, 'o'.blue, count)
      end
      game, count = game.board_update
      win = Verification.new(game, count)
      win = win.is_finished
      if win.zero?
        count += 1
      elsif win == 1
        puts "#{player1} à gagné !"
        verif = false
      elsif win == 2
        puts "#{player2} à gagné !"
        verif = false
      else
        puts 'Égalité !'
        verif = false
      end
    else
      puts 'Entrez un nombre entre 1 et 9'
    end
  end
  puts 'Voulez vous recommencer ? [o/n]'
  var = gets.chomp
  if var == 'o'
    continue = true
    game = Board.new
    game = game.base_board
    count = 0
    help = true
    verif = true
    continue = true
  else
    continue = false
  end
  game_num += 1
end
 
