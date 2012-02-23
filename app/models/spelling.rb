# require 'lingua'
require "char"
include Lingua::EN

class Spelling < ActiveRecord::Base
  has_many :words
  has_many :lexes, :through => :word
  has_and_belongs_to_many :tags

  attr_accessible :spelling
  after_initialize :update_numbers

  def spelling=(txt)
      self[:spelling] = txt.downcase.strip
      update_numbers
  end

  protected  
  def update_numbers
    if self[:spelling]
      self[:syllables]  = Syllable::syllables(self[:spelling])
      self[:length]     = self[:spelling].length
      self[:scrabble]   = self[:spelling].chars.map { |c| Char.points(c) }.reduce(:+)
    end
  end

end
