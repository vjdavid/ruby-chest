class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :serial
      t.references :site_id
      t.references :location_id
      t.boolean :stockable
      t.references :itype_id

      t.timestamps
    end
    add_index :items, :site_id_id
    add_index :items, :location_id_id
    add_index :items, :itype_id_id
  end
end
