class CreateTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :tickets do |t|
      t.string :status
      t.string :photo_1
      t.string :photo_2
      t.string :photo_3
      t.references :user, foreign_key: true
      t.string :city
      t.string :postal_code
      t.boolean :tune_up
      t.boolean :brakes
      t.boolean :flat_tire
      t.boolean :chain
      t.boolean :gears
      t.boolean :wheels
      t.boolean :frame
      t.boolean :other
      t.text :description

      t.timestamps
    end
  end
end
