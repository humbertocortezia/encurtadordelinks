class AddIpxToLikes < ActiveRecord::Migration[6.1]
  def change
    add_column :likes, :ipx, :string
  end
end
