class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.integer :user_id
      t.string :title
      t.string :company
      t.string :location
      t.string :link
      t.text :description
      t.string :status

      t.timestamps
    end
  end
end
