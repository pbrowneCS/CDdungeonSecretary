class CreateEncounters < ActiveRecord::Migration
  def change
    create_table :encounters do |t|
      t.string :name
      t.string :description
      t.references :campaign, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
