class CreateDbconfigs < ActiveRecord::Migration
  def self.up
    create_table :dbconfigs do |t|
      t.string :name
      t.string :value

      t.timestamps
    end
  end

  def self.down
    drop_table :dbconfigs
  end
end
