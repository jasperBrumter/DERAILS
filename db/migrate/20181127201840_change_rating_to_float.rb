class ChangeRatingToFloat < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :average_rating, :float
  end
end
