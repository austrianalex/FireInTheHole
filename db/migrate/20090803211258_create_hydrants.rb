class CreateHydrants < ActiveRecord::Migration
  def self.up
    create_table :hydrants do |t|
      t.string :latitude
      t.string :longitude
      t.timestamp :serviced
      t.string :color

      t.timestamps
    end
  end

  def self.down
    drop_table :hydrants
  end
end
