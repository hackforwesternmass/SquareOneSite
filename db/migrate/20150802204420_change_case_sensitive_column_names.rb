class ChangeCaseSensitiveColumnNames < ActiveRecord::Migration
  def change
   rename_column :providers, :lName, :lname
   rename_column :providers, :fName, :fname

  end
end
