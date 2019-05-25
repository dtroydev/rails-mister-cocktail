class AddQuantityToDoses < ActiveRecord::Migration[5.2]
  def change
    add_column :doses, :quantity, :string, default: '1'
  end
end
