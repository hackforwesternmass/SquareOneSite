class Attendance < ActiveRecord::Base
  belongs_to :child
  belongs_to :provider
  validates :child_id, :provider_id, :childTermDate, :dateOfService, :timeIn, :timeOut, presence: true
end
