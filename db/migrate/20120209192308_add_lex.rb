class AddLex < ActiveRecord::Migration
	def change
		create_table :Lex do |table|
			table.string :name
		end
	end
end
