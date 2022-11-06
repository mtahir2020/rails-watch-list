class ChangeLocationToAddress < ActiveRecord::Migration[7.0]
  def change
    rename_column(:lists, :location, :address)
  end
end
