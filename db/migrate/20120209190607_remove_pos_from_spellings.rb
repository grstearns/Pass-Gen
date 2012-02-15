class RemovePosFromSpellings < ActiveRecord::Migration
  def up
    remove_column :spellings, :part_of_speech
      end

  def down
    add_column :spellings, :part_of_speech, :string
  end
end
