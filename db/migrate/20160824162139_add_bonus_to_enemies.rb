class AddBonusToEnemies < ActiveRecord::Migration
  def change
    add_column :enemies, :bonus, :integer
  end
end
