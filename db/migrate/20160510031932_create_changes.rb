class CreateChanges < ActiveRecord::Migration[5.0]
  def change
    create_table :changes do |t|
      t.integer :user_id, null: false
      t.string :controller, null: false
      t.string :action, null: false
      t.text :params, null: false
      t.text :model_attributes

      t.timestamps
    end

    execute MigrateUtil.foreign_key(:changes, :user_id, :users)
  end
end
