class FixChildCase < ActiveRecord::Migration
  def change
         rename_column :children, :lName, :lname

  end
end
