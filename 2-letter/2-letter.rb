class Game
    def initialize()
        @correct_words = File.open("2-letter-true.txt").to_a.map { |word| word.tr("^A-Z", "") }
        @incorrect_words = File.open("2-letter-false.txt").to_a.map { |word| word.tr("^A-Z", "") }
        @correct = 0
        @incorrect = 0
        @correct_words_false = Array.new
        @incorrect_words_false = Array.new
        @game_going = true
    end
    attr_accessor :correct, :incorrect, :correct_words_false, :incorrect_words_false, :correct_words, :incorrect_words, :game_going

    def question(fake_or_real) 
            puts "is this word legit?"
            if fake_or_real == 0
                puts self.incorrect_words.sample
            elsif fake_or_real == 1
                puts self.correct_words.sample
            end
    end

    def play
        puts "Welcome! Use y for yes and n for no. Enter q to quit at any time."
        while self.game_going
            rand = rand(2)
            p "correct: " + self.correct.to_s
            p "incorrect: " + self.incorrect.to_s
            question(rand)
            y_or_n = gets.chomp
            if rand == 0 && y_or_n == "n" || rand == 1 && y_or_n == "y"
                puts "YOU ARE RIGHT!"
                self.correct += 1
            elsif y_or_n == "q"
                self.game_going = false
            else 
                puts "YOU ARE WRONG!"
                self.incorrect += 1 
            end
            system "clear"
        end
    end
end

test = Game.new

test.play