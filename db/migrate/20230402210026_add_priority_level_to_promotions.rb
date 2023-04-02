class AddPriorityLevelToPromotions < ActiveRecord::Migration[5.2]
  def change
    add_column :promotions, :priority_level, :integer
  end
end
