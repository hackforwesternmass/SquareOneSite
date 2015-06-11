class Child < ActiveRecord::Base
  belongs_to :provider
  has_many :attendances
  validates :fName, :lName, :dob, :fundSrc, :trans, :startDate, :provider_id, presence: true
  validates :trans, :inclusion => { :in => 0..2 }
end
