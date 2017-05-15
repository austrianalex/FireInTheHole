class CreateGroups < ActiveRecord::Migration
  def self.up
    create_table :groups do |t|
      t.string :title
      t.boolean :user
      t.boolean :admin

      t.timestamps
    end
  end

  def self.down
    drop_table :groups
  end
end
