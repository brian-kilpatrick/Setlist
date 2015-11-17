class AddOrganizaionIdToSongsTable < ActiveRecord::Migration
  def change
  	add_column :songs, :organization_id, :integer
  	add_index :songs, :organization_id
  end
end
