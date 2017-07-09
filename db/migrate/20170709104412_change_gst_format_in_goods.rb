class ChangeGstFormatInGoods < ActiveRecord::Migration[5.1]
  def change
    change_column :goods, :gst, :number
  end
end