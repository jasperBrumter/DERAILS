class CreateResponses < ActiveRecord::Migration[5.2]
  def change
    create_table :responses do |t|
      t.references :user, foreign_key: true
      t.references :ticket, foreign_key: true
      t.text :content
      t.string :contact
      t.integer :price
      t.string :status

      t.timestamps
    end
  end
end
