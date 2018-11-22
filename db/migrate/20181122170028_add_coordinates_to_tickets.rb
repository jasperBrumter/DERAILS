class AddCoordinatesToTickets < ActiveRecord::Migration[5.2]
  def change
    add_column :tickets, :latitude, :float
    add_column :tickets, :longitude, :float
    add_column :tickets, :address, :string
    add_column :tickets, :specific_details, :text
  end
end
