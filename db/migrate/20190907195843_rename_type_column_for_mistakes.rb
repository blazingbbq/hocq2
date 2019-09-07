class RenameTypeColumnForMistakes < ActiveRecord::Migration[6.0]
  def change
    rename_column :mistakes, :type, :mistake_type
  end
end
