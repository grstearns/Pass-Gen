class Lex < ActiveRecord::Base
  has_many :words
  has_many :spelling, :through => :word

  def name=(txt)
    self[:name] = txt.to_s.downcase.strip
  end
end
