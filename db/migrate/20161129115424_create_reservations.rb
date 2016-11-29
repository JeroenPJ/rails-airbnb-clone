class CreateReservations < ActiveRecord::Migration[5.0]
  def change
    create_table :reservations do |t|
      t.date :starting_date
      t.date :ending_date
      t.float :overall_price
      t.references :motorcycle, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
