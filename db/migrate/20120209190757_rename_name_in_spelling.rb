class RenameNameInSpelling < ActiveRecord::Migration
	def change
	  rename_column :spellings, :name, :spelling	
	end
end
