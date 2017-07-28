class CreateCampaigns < ActiveRecord::Migration[5.1]
  def change
    create_table :campaigns do |t|
      t.string :source
      t.string :medium
      t.string :term
      t.string :content
      t.string :name

      t.timestamps
    end
  end
end
