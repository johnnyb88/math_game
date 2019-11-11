require_relative "players"
require_relative "questions"

class Game
  attr_accessor :Player1, :Player2

  def initialize
    @players = []
    @players.push(Player.new(1))
    @players.push(Player.new(2))
    @p1 = @players[0]
    @p2 = @players[1]
  end

  def game_start
    puts "------ NEW GAME ------"
    @players.cycle do |player|
      if @p1.lives > 0 && @p2.lives > 0
        game_question = Question.new
        puts "Player #{player.name}:"
        puts "#{game_question.question}"
        answer = game_question.answer

        if answer == game_question.correct_answer
          puts "Player #{player.name}: YES! You are correct."
          puts "P1: #{@p1.lives}/3 vs P2: #{@p2.lives}/3"
          puts "----------------------"

        else 
          puts "Player #{player.name}: Seriously? No!"
          player.lives -= 1
          puts "P1: #{@p1.lives}/3 vs P2: #{@p2.lives}/3"
          puts "----------------------"
        end

      else
        if @p1.lives == 0
          puts "Player 2 wins with a score of #{@p2.lives}/3"
          puts "------ GAME OVER ------"
          break
        else @p2.lives == 0
          puts "Player 1 wins with a score of #{@p1.lives}/3"
          puts "------ GAME OVER ------"
          break
        end
      end
  end
end

def new_turn
  puts "------ NEW TURN ------"
  game_question = Question.new
  game_question.question
end


end

new_game = Game.new
p new_game.game_start