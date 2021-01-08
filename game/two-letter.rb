require_relative "game"

true_words = File.open("2-letter-true.txt").to_a.map { |word| word.tr("^A-Z", "") }
false_words = File.open("2-letter-false.txt").to_a.map { |word| word.tr("^A-Z", "") }

two_letter = Game.new(true_words, false_words)

two_letter.play