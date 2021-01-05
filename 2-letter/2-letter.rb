class Game
    def initialize()
        @correct_words = File.open("2-letter-true.txt").to_a.map { |word| word.tr("^A-Z", "") }
        @incorrect_words = File.open("2-letter-false.txt").to_a.map { |word| word.tr("^A-Z", "") }
        @correct = 0
        @incorrect = 0
        @correct_words_false = Array.new
        @incorrect_words_false = Array.new
    end
    attr_accessor :correct, :incorrect, :correct_words_false, :incorrect_words_false, :correct_words, :incorrect_words
end

test = Game.new

test.correct_words

test.incorrect_words.each do |word|
    p word
end