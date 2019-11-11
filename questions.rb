class Question
  attr_accessor :question, :correct_answer

  ARITHMETIC = ['+', '-'].sample # retrun random element from array

  def initialize
    @num1 = rand(1..20)
    @num2 = rand(1..20) # .. is an inclusive range
    @question = "#{@num1} #{ARITHMETIC} #{@num2}"
    @correct_answer = eval(@question)
  end

  def question
    puts "what does #{@question} equal?"
  end

  def answer
    input = gets.chomp.to_i
  end
end
