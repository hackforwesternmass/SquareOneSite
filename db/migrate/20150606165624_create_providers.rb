class CreateProviders < ActiveRecord::Migration
  def change
    create_table :providers do |t|
      t.string :fName
      t.string :middle
      t.string :lName
      t.string :addr1
      t.string :addr2
      t.string :city
      t.string :state
      t.integer :zip
      t.string :phone
      t.string :email
      t.integer :licenseCap
      t.integer :sqOneCap
      t.date :licenseExpDate
      t.string :certLevel
      t.boolean :sqOneRepl

      t.timestamps null: false
    end
  end
end
