class ChangeAnswerColumnsForMistake < ActiveRecord::Migration[6.0]
  def change
    change_column :mistakes, :answer_party, :string, null: true
    change_column :mistakes, :answer_name, :string, null: true
  end
end
