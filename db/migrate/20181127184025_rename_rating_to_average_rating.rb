class RenameRatingToAverageRating < ActiveRecord::Migration[5.2]

  def change
    rename_column :users, :rating, :average_rating
  end
end
