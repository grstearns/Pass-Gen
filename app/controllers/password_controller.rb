require "rand_string"
require "koremu"

class PasswordController < ApplicationController
  def index
  	ran = Crypt::ISAAC.new

  	#
  	@nouns = Word.random(lex: :noun, rand: ran)
  	@adjectives = Word.random(lex: :adjective, rand: ran)
  	@verbs = Word.random(lex: :verb, rand: ran)

  	@table = @verbs.zip @adjectives, @nouns

  	#
  	@rand_string = RandString::alphanum(rand: ran)
  	@rand_hex = RandString::hex(rand: ran)
  	@rand_printable = RandString::printable(rand: ran)

  	#
	@pin = Array.new
  	4.times{ @pin << ran.rand(9999) }

  	#
  	@kore = Array.new
  	4.times{ @kore << KoremuFixnum.new(ran.rand(9999999)).to_ks }
  end

  def show(number=4, type=:any)
  	@words = Word.random(:type, number)
  end



end
