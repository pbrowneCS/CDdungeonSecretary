class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.text :notes
      t.boolean :active
      t.integer :initiative
      t.integer :bonus
      t.references :campaign, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
