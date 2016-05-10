class CreatePages < ActiveRecord::Migration[5.0]
  def change
    create_table :pages do |t|
      t.string :title, null: false
      t.text :body      
      t.integer :site_id, null: false
      t.integer :version_number, null: false
      t.jsonb :doc, null: false, default: '{}'

      t.timestamps
    end

    execute MigrateUtil.foreign_key(:pages, :site_id, :sites)
  end
end
