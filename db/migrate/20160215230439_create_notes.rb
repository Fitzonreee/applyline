class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string :job_id
      t.string :integer
      t.integer :user_id
      t.text :content

      t.timestamps
    end
  end
end
