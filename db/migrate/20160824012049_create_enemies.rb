class CreateEnemies < ActiveRecord::Migration
  def change
    create_table :enemies do |t|
      t.string :name
      t.text :notes
      t.boolean :active
      t.references :encounter, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
