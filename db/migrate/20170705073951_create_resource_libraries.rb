class CreateResourceLibraries < ActiveRecord::Migration[5.1]
  def change
    create_table :resource_libraries do |t|
      t.string :name

      t.timestamps
    end
  end
end
