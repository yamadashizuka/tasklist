class CreateStatuscodes < ActiveRecord::Migration
  def change
    create_table :statuscodes do |t|
      t.string :name

      t.timestamps
    end
  end
end
