class AddStuffToWord < ActiveRecord::Migration
  def up
    add_column :words, :part_of_speech, :string
    add_column :words, :syllables, 	:integer
    add_column :words, :length, 	:integer
    add_column :words, :scrabble, 	:integer
  end

  def down
    remove_column :words, :part_of_speech
    remove_column :words, :syllables
    remove_column :words, :length
    remove_column :words, :scrabble
  end
end
