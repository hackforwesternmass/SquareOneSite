class AddTerminationDateToChildren < ActiveRecord::Migration
  def change
    add_column :children, :terminationDate, :date
  end
end
