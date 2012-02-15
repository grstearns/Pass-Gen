class PasswordController < ApplicationController
  def index
  	@nouns = Word.random(:noun)
  	@adjectives = Word.random(:adjective)
  	@verbs = Word.random(:verb)

  	@table = @verbs.zip @adjectives, @nouns
  end

  def show(number=4, type=:any)
  	@words = Word.random(:type, number)
  end


end
