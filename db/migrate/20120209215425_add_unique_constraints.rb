class AddUniqueConstraints < ActiveRecord::Migration
  def create
	add_index :lexes, :name, :uniqueness => true
  	add_index :words, [:lex_id, :spelling_id], :uniqueness => true
  	add_index :spellings, :spelling, :uniqueness => true
  end
end
