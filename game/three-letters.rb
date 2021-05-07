require_relative "game"

true_words = File.open("3-letter-true.txt").to_a.map { |word| word.tr("^A-Z", "") }
false_words = File.open("3-letter-false.txt").to_a.map { |word| word.tr("^A-Z", "") }

three_letter = Game.new(true_words, false_words)

three_letter.play