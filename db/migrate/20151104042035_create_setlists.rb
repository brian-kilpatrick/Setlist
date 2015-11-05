class CreateSetlists < ActiveRecord::Migration
  def change
    create_table :setlists do |t|
      t.string :name
      t.datetime :date
      t.datetime :rehearsal
      t.integer :editor
      t.belongs_to :organization, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
