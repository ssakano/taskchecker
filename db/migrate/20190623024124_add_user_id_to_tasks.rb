class AddUserIdToTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.string :task
      t.references :user, foreign_key: true
      
      t.timestamps
    end
  end
end
