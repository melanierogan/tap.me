class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :type
      t.string :body
      t.string :address
      t.float :latitude
      t.float :logitude
      t.references :user
      t.timestamps
    end
  end
end
