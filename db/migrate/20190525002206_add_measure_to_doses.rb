class AddMeasureToDoses < ActiveRecord::Migration[5.2]
  def change
    add_column :doses, :measure, :string, default: 'ml(s)'
  end
end
