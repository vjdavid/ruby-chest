class CreateOptions < ActiveRecord::Migration
  def change
    create_table :options do |t|
      t.string :starttag

      t.timestamps
    end
  end
end
