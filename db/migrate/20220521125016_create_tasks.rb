class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string     :text
      t.datetime   :deadline
      t.boolean    :is_done, default: false
      t.belongs_to :user
      t.belongs_to :project

      t.timestamps
    end
  end
end
