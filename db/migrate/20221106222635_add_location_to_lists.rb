class AddLocationToLists < ActiveRecord::Migration[7.0]
  def change
    add_column :lists, :location, :string
  end
end
