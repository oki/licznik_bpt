class CreateTrips < ActiveRecord::Migration
  def self.up
    create_table :trips do |t|
      t.integer :biker_id
      t.integer :month
      t.integer :dist
      t.text :message

      t.timestamps
    end
  end

  def self.down
    drop_table :trips
  end
end
