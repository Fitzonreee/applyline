class RemoveIntegerColumn < ActiveRecord::Migration
  def change
    remove_column :notes, :integer
  end
end
