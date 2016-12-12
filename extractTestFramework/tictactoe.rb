#board = [[],[],[]]
#p1 = "X"
#p2 = "Y"
class Game
  attr_accessor :board
  def initialize
    @board = [[],[],[]]
    @winner = false
  end

  def makeMove(*args)
    symbol = args[0]
    x = args[1]
    y = args[2]
    if self.board[x][y]
      p "sorry you can't move where someone has already moved"
      return
    else
      @board[x][y] = symbol
    end
    @winner = true if @board[0][0] == 'X' and @board[0][1] == 'X' and @board[0][2] == 'X'
  end
  def winner_exists?
    @winner == true
  end
end

#test helpers
def makeSequenceOfMoves(game, array_of_arrays)
  array_of_arrays.each do |array|
    game.makeMove(array)
  end
end


p "you can add a player's symbol to a location in the board"
game = Game.new
raise "something bad like expected emptiness but didn't get that" unless game.board[0].empty?
game.makeMove("X",0,0)
raise "something bad like expected an X at 0,0 BUT didn't get that" if game.board[0].empty?
p "we made it!"


p "you can only makeMove if that slot is empty"
game = Game.new
game.makeMove("X",0,1)
game.makeMove("Y",0,1)
raise "oopsie we overwrote" if game.board[0][1] == "Y"
raise "oopsie we overwrote" unless game.board[0][1] == "X"
p "yay we made it 2nd time"

p 'it raises an error if no winner exists even though there shouldbe - basically fundamental existence problem'
game = Game.new
makeSequenceOfMoves(game, [["X", 0, 0],["X", 0, 1],["X", 0, 2]])
# game.makeMove("X",0,0)
# game.makeMove("X",0,1)
# game.makeMove("X",0,2)
raise 'No winner - well it should have been youu but we are a broken game' unless game.winner_exists?
p "so we succeeded for 3rd time"
