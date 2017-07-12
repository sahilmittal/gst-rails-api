class ChangeGstFormatToNumericInGoods < ActiveRecord::Migration[5.1]
  def change
    change_column :goods, :gst, :numeric
  end
end
