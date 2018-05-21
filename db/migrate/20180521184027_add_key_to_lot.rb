class AddKeyToLot < ActiveRecord::Migration[5.1]
  def change
    add_column :lots, :key, :string
  end
end
