class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.boolean :is_completed, default: false 

      t.timestamps null: false
    end
  end
end
