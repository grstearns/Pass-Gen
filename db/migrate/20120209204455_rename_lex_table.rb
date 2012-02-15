class RenameLexTable < ActiveRecord::Migration
	def change
		rename_table :Lex, :lexes
	end
end
