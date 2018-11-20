class AddColumnToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
    add_column :users, :email, :string
    add_column :users, :photo, :string
    add_column :users, :is_mechanic, :boolean
    add_column :users, :rating, :integer
  end
end
