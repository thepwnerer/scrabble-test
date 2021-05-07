class Game
    def initialize(true_words, false_words)
        @correct_words = true_words
        @incorrect_words = false_words
        @correct = 0
        @incorrect = 0
        @correct_words_wrong = Hash.new(0)
        @incorrect_words_wrong = Hash.new(0)
        @game_going = true
    end
    attr_accessor :correct, :incorrect, :correct_words_wrong, :incorrect_words_wrong, :correct_words, :incorrect_words, :game_going

    def question(fake_or_real) 
            puts "is this word legit?"
            if fake_or_real == 0
                puts word = self.incorrect_words.sample
            elsif fake_or_real == 1
                puts word = self.correct_words.sample
            end
            word
    end

    def wrong_answer()
        puts "YOU ARE WRONG!"
        self.incorrect += 1
    end

    def processing_answer(rand, y_or_n, word)
        if rand == 0 && y_or_n == "n" || rand == 1 && y_or_n == "y"
                puts "YOU ARE RIGHT!"
                self.correct += 1
            elsif y_or_n == "q"
                self.game_going = false
            elsif rand == 0 && y_or_n == "y"
                self.incorrect_words_wrong[word] += 1
                wrong_answer()
            elsif rand == 1 && y_or_n == "n"
                self.correct_words_wrong[word] += 1
                wrong_answer()
            end
    end
    def incorrect_output_printing()
        p "The correct words you got wrong (guessed false) were the following: word -> times incorrect"
        if self.correct_words_wrong.length == 0
            p "None here!"
        else
            self.correct_words_wrong.each do |key, value|
                p key + " -> " + value.to_s
            end
        end
        p "The incorrect words you got wrong (guessed true) were the following: word -> times incorrect"
        if self.incorrect_words_wrong.length == 0
            p "None here!"
        else
            self.incorrect_words_wrong.each do |key, value|
                p key + " -> " + value.to_s
            end
        end
    end

    def play
        puts "Welcome! Use y for yes and n for no. Enter q to quit at any time."
        while self.game_going
            p "correct: " + self.correct.to_s
            p "incorrect: " + self.incorrect.to_s
            rand = rand(2)
            word = question(rand)
            y_or_n = gets.chomp
            processing_answer(rand, y_or_n, word)
            system "clear"
        end
        incorrect_output_printing()
    end
end