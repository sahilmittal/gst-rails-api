class CreateResources < ActiveRecord::Migration[5.1]
  def change
    create_table :resources do |t|
      t.string :name
      t.belongs_to :resource_library, foreign_key: true

      t.timestamps
    end
  end
end
