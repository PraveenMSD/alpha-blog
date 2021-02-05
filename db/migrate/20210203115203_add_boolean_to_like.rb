class AddBooleanToLike < ActiveRecord::Migration[6.1]
  def change
    add_column :likes, :like, :boolean



  end
end
