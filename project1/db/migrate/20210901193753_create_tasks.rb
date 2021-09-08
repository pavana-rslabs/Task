class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :title
      t.string :description
      t.string :text
      t.string :due_date
      t.string :datetime

      t.timestamps
    end
  end
end
