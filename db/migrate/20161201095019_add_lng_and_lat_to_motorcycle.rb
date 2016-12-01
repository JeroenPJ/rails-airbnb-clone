class AddLngAndLatToMotorcycle < ActiveRecord::Migration[5.0]
  def change
    add_column :motorcycles, :lng, :float
    add_column :motorcycles, :lat, :float
  end
end
