class CreateTimeOffs < ActiveRecord::Migration
  def change
    create_table :time_offs do |t|
      t.date :startDate
      t.date :endDate
      t.string :approved
      t.string :comments
      t.references :provider, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
