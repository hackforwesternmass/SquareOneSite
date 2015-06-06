class Provider < ActiveRecord::Base
    has_many :children
    validates :fName, :middle, :lName, :addr1, :city, :state, :zip, :phone, :email, :licenseCap, :sqOneCap, :licenseExpDate, :certLevel, presence: true

end