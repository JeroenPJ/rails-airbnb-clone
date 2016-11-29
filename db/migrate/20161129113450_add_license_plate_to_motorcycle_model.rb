class AddLicensePlateToMotorcycleModel < ActiveRecord::Migration[5.0]
  def change
    add_column :motorcycles, :license_plate, :string
  end
end
