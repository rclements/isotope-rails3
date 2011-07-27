class AddAlumniToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :alumni, :boolean
  end

  def self.down
    remove_column :users, :alumni
  end
end
