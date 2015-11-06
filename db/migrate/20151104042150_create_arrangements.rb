class CreateArrangements < ActiveRecord::Migration
  def change
    create_table :arrangements do |t|
      t.string :title
      t.string :keyof
      t.string :length
      t.text :lyrics
      t.integer :bpm
      t.belongs_to :song

      t.timestamps null: false
    end
  end
end
