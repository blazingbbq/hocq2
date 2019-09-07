class CreateMistakes < ActiveRecord::Migration[6.0]
  def change
    create_table :mistakes do |t|
      t.string :type, null: false
      t.string :answer_name, null: false
      t.string :answer_party, null: false

      t.belongs_to :user
      t.belongs_to :game

      t.references :mp

      t.timestamps
      t.datetime :deleted_at
    end
  end
end
