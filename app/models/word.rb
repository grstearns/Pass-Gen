
require "char"
include Lingua::EN

class Word < ActiveRecord::Base

  has_and_belongs_to_many :tags
  attr_accessible :spelling
  after_initialize :update_numbers

  def spelling=(txt)
      self[:spelling] = txt.downcase.strip
      update_numbers
  end

  def self.random(opts={})
    tags=opts[:tags] || Tag.all
    number=opts[:number] || opts[:count] || opts[:size] || 4
    rand=opts[:rand] || Random.new

    ids = self.with_tags(tags).sample(number, random: rand)
  end

  def self.with_tags(tags=[])
    Word.includes(:tags).where('tags.name in (?)', tags)
  end


  def self.create_from_names(names={})
    lex = Tag.find_or_create_by_name(names[:tag] || names[:lex] || names[:part_of_speech])
    word = Word.find_or_create_by_spelling(names[:word] || names[:spelling])
    
    word.tags << lex
    word.save
  end



  protected  
  def update_numbers
    if self.spelling
      self.syllables  = Syllable::syllables(self.spelling)
      self.length     = self.spelling.length
      self.scrabble   = self.spelling.chars.map { |c| Char.points(c) }.reduce(:+)
    end
  end

end