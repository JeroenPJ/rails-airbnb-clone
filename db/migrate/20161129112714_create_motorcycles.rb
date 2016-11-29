class CreateMotorcycles < ActiveRecord::Migration[5.0]
  def change
    create_table :motorcycles do |t|
      t.string :name, default: nil
      t.references :user, foreign_key: true
      t.string :brand
      t.string :model
      t.integer :year
      t.string :city
      t.string :address
      t.boolean :availability
      t.integer :price
      t.text :description

      t.timestamps
    end
  end
end
