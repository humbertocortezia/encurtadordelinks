class CreateLikes < ActiveRecord::Migration[6.1]
  def change
    create_table :likes do |t|
      t.string :url_ori
      t.string :url_curt
      t.float :cont

      t.timestamps
    end
  end
end
