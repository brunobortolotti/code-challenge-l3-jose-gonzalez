class CreateUrls < ActiveRecord::Migration[7.1]
  def change
    create_table :urls do |t|
      t.string :token
      t.text :original_link
      t.integer :visited_count

      t.timestamps
    end
  end
end
