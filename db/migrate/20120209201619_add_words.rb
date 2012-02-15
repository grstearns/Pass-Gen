class AddWords < ActiveRecord::Migration
	def change
		create_table :words do |table|
			table.references :lex
			table.references :spelling
		end
	end
end
