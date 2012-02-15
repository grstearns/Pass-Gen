class RenameWordsToSpellings < ActiveRecord::Migration
	def change
		rename_table 'words', 'spellings'
	end
end
