class CreateBikers < ActiveRecord::Migration
  def self.up
    create_table :bikers do |t|
      t.string :nick

      t.timestamps
    end
  end

  def self.down
    drop_table :bikers
  end
end
