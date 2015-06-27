class Provider < ActiveRecord::Base
    has_many :children
    has_many :time_offs
    validates :fName, :lName, :addr1, :city, :state, :zip, :phone, :email, :licenseCap, :sqOneCap, :licenseExpDate, :certLevel, presence: true
end