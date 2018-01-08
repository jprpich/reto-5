class Question

  def initialize(term, definition)
    @term = term
    @definition = definition
  end

  def message
    "Definition\n#{@definition}"
  end

  def check
    while true
      puts "> "
      @answer = gets.chomp
      
      if @answer == @term
        puts "Correct!"
        break
      end

      puts "Incorrect :( Try again!"
    end
  end

end


class Game

  attr_reader :questions

  def initialize
      @questions = []
      build_questions
  end

  private 
    def build_questions 
      File.open("archivo.txt").each do |line|
        new_line = line.split(";")
        @questions << Question.new(new_line[1].strip, new_line[0])
      end
    end

end

# start the game
puts "Welcome to Ruby Definitions. To play just enter the correct term for each definition. Ready? Let's go!" 

# build the questions
game = Game.new

# logic of the game
game.questions.each do |question|
  puts question.message
  question.check
end

# end the game
puts "Great Job! You are doing good. Keep up the amazing work :)"




