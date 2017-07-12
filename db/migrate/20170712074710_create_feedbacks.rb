class CreateFeedbacks < ActiveRecord::Migration[5.1]
  def change
    create_table :feedbacks do |t|
      t.text :message
      t.string :user_email
      t.boolean :resolved, default: false

      t.timestamps
    end
  end
end
