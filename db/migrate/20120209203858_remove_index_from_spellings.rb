class RemoveIndexFromSpellings < ActiveRecord::Migration
	def change
		remove_index :spellings, :spelling
	end
end
