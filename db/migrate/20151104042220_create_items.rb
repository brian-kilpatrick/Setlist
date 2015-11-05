class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.belongs_to :arrangement, index: true, foreign_key: true
      t.belongs_to :setlist, index: true, foreign_key: true
      t.integer :position

      t.timestamps null: false
    end
  end
end
