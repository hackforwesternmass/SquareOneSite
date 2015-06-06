class CreateChildren < ActiveRecord::Migration
  def change
    create_table :children do |t|
      t.string :fName
      t.string :middle
      t.string :lName
      t.date :dob
      t.string :fundSrc
      t.integer :trans
      t.date :startDate
      t.references :provider, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
