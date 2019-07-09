class ChangeColumnNameTypo < ActiveRecord::Migration[5.2]
  def change
    rename_column :posts, :logitude, :longitude
  end
end
