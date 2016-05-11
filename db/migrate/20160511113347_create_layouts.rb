class CreateLayouts < ActiveRecord::Migration[5.0]
  def change
    create_table :layouts do |t|
      t.string :name, null: false
      t.jsonb :sections, null: false

      t.timestamps
    end

    execute MigrateUtil.foreign_key(:pages, :layout_id, :layouts)
  end
end
