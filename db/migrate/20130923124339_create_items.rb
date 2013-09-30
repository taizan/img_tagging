class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.integer :id
      t.string :author

      t.timestamps
    end
  end
end
