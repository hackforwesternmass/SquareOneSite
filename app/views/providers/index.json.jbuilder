json.array!(@providers) do |provider|
  json.extract! provider, :id, :fName, :middle, :lName, :addr1, :addr2, :city, :state, :zip, :phone, :email, :licenseCap, :sqOneCap, :licenseExpDate, :certLevel, :sqOneRepl
  json.url provider_url(provider, format: :json)
end
