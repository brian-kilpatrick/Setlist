class CreateSetlists < ActiveRecord::Migration
  def change
    create_table :setlists do |t|
      t.string :name
      t.date :performance_date
      t.time :performance_time
      t.date :rehearsal_date
      t.time :rehearsal_time
      t.integer :editor
      t.belongs_to :organization, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
