class Provider < ActiveRecord::Base
    has_many :children
    validates :fName, :lName, :addr1, :city, :state, :zip, :phone, :email, :licenseCap, :sqOneCap, :licenseExpDate, :certLevel, presence: true

    def self.search(provider_id)
       return all.order('lName') unless provider_id.present?
       where(['id = ?', provider_id])
    end
end