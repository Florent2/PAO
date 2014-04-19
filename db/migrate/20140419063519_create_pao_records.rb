class CreatePaoRecords < ActiveRecord::Migration
  def change
    create_table :pao_records do |t|
      t.integer :pao_number, unique: true
      t.string :pao_person, unique: true
      t.string :pao_action, unique: true
      t.string :pao_object, unique: true

      t.timestamps
    end
  end
end
