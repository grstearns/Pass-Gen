class Word < ActiveRecord::Base
  belongs_to :spelling
  belongs_to :lex

  def self.random_words(lex, number=4)
    self.random_words_from_ids(self.by_lex(lex), number)
  end

  def self.by_lex(lex)
    self.joins(:lex).where(:lexes => {:name => lex}).includes(:spelling)
  end


  def self.from_names(names={})
    lex = Lex.find_or_create_by_name(names[:lex] || names[:part_of_speech])
    spelling = Spelling.find_or_create_by_spelling(names[:spelling] || names[:word])
    
    self.new(:lex => lex, :spelling => spelling)
  end


  protected
  def self.random_words_from_ids(ids, count=4)
    ids.to_ary.sample(4, random: Crypt::ISAAC.new)
  end
end
