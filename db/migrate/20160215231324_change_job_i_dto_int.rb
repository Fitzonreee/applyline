class ChangeJobIDtoInt < ActiveRecord::Migration
  def change
    change_column :notes, :job_id, :integer
  end
end
