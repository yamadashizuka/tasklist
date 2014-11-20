class RenameStatusIdToStatusCodeIdToTasks < ActiveRecord::Migration
  def change
    rename_column :tasks, :status_id, :statuscode_id
  end
end
