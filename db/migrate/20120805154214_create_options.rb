class CreateOptions < ActiveRecord::Migration
  def change
    create_table :options do |t|
      t.string :assettag

      t.timestamps
    end
  end
end
