class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :role
      t.boolean :admin
      t.string :phone

      t.timestamps null: false
    end
  end
end
