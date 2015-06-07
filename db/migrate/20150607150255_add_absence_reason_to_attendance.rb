class AddAbsenceReasonToAttendance < ActiveRecord::Migration
  def change
    add_column :attendances, :absenceReason, :string
  end
end
