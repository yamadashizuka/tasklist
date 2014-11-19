class RenameStatusesToStatuscodes < ActiveRecord::Migration
  def change
    rename_table :statuses, :statuscodes
  end
end
