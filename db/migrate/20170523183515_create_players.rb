class CreatePlayers < ActiveRecord::Migration[5.1]
  def change
    create_table :players do |t|
      t.string :steam_link
      t.string :nick
      t.text :description
      t.string :server

      t.timestamps
    end
  end
end
