# require 'lingua'
# include Lingua::EN

# class Word < ActiveRecord::Base
#   attr_reader :word, :part_of_speech, :syllables, :length, :scrabble
  
#   def initialize(word, part_of_speech, *args)
#     @word = word.capitalize.strip
#     @syllables = Syllable::syllables(@word)

#     @part_of_speech = part_of_speech.to_s.capitalize.strip.to_sym

#     @length = @word.length
#     @scrabble = @word.chars.map { |c| Char.points(c) }.reduce(:+)

#     super *args
#   end
# end
