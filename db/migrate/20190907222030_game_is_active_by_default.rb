class GameIsActiveByDefault < ActiveRecord::Migration[6.0]
  def change
    change_column_default :games, :active?, true
  end
end
