class CreateCodes < ActiveRecord::Migration[5.1]
  def change
    create_table :codes do |t|
      t.string :name
      t.bigint :code
      t.string :code_type

      t.timestamps
    end
  end
end
