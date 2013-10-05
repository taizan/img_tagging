class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.integer :id
      t.string :author
      t.integer :point ,:default => 0

      t.timestamps
    end
  end
end
