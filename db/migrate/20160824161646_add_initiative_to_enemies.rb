class AddInitiativeToEnemies < ActiveRecord::Migration
  def change
    add_column :enemies, :initiative, :integer
  end
end
