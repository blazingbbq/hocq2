class CreateMps < ActiveRecord::Migration[6.0]
  def change
    create_table :mps do |t|
      t.string :name, null: false
      t.string :party, null: false
    end
  end
end
