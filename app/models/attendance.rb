class Attendance < ActiveRecord::Base
  belongs_to :child
  belongs_to :provider
end
