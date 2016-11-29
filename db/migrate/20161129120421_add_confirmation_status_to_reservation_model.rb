class AddConfirmationStatusToReservationModel < ActiveRecord::Migration[5.0]
  def change
    add_column :reservations, :confirmed, :boolean
  end
end
