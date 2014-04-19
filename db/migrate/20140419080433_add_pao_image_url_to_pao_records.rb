class AddPaoImageUrlToPaoRecords < ActiveRecord::Migration
  def change
    add_column :pao_records, :pao_image_url, :string
  end
end
