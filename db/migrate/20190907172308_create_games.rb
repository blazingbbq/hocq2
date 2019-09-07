class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.boolean :active?, null: false
      t.string :seen, array: true, default: []

      t.belongs_to :user

      t.timestamps
    end
  end
end
