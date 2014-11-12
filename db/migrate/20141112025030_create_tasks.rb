class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.datetime :limit
      t.integer :status_id

      t.timestamps
    end
  end
end
