class CreateAttendances < ActiveRecord::Migration
  def change
    create_table :attendances do |t|
      t.references :child, index: true, foreign_key: true
      t.references :provider, index: true, foreign_key: true
      t.date :childTermDate
      t.date :dateOfService
      t.datetime :timeIn
      t.datetime :timeOut
      t.string :absent
      t.string :whoCreated
      t.date :dateCreated
      t.string :whoEdited
      t.date :dateEdited

      t.timestamps null: false
    end
  end
end
