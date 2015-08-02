class ChangeCaseSensitiveColumnNames < ActiveRecord::Migration
  def change
   rename_column :providers, :lName, :lname
  

  end
end
