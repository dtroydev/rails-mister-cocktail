class AddVarietyToDoses < ActiveRecord::Migration[5.2]
  def change
    add_column :doses, :variety, :string
  end
end
