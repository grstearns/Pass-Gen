class Word < ActiveRecord::Base
  belongs_to :spelling
  belongs_to :lex

  def self.random(opts={})
    lex=opts[:lex] || :any
    number=opts[:number] || opts[:count] || opts[:size] || 4
    rand=opts[:rand] || Random.new

    self.by_lex(lex).to_ary.sample(number, random: rand)
  end

  def self.by_lex(lex=:any)
    if lex == :any
      self.joins(:lex).includes(:spelling)
    else
      self.joins(:lex).where(:lexes => {:name => lex}).includes(:spelling)    
    end
  end


  def self.create_from_names(names={})
    lex = Lex.find_or_create_by_name(names[:lex] || names[:part_of_speech])
    spelling = Spelling.find_or_create_by_spelling(names[:spelling] || names[:word])
    
    self.new(:lex => lex, :spelling => spelling)
  end
end
