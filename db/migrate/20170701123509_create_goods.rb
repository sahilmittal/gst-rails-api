class CreateGoods < ActiveRecord::Migration[5.1]
  def change
    create_table :goods do |t|
      t.string :name
      t.integer :gst
      t.belongs_to :category, foreign_key: true

      t.timestamps
    end
  end
end
