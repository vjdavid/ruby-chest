class RenameIDs < ActiveRecord::Migration
  def change
	rename_column :items, :location_id_id, :location_id
	rename_column :items, :site_id_id, :site_id
	rename_column :items, :itype_id_id, :itype_id
  end
end
