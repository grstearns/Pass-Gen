class PasswordController < ApplicationController
  def index
  	@nouns = Word.random_words(:noun)
  	@adjectives = Word.random_words(:adjective)
  	@verbs = Word.random_words(:verb)

  	@table = @verbs.zip @adjectives, @nouns
  end
end
