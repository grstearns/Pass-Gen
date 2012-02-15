class AddIndexToWordName < ActiveRecord::Migration
  def change
  	add_index :words, [:name, :part_of_speech], unique: true
  end
end
