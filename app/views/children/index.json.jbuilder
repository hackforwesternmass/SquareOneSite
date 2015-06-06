json.array!(@children) do |child|
  json.extract! child, :id, :fName, :middle, :lName, :dob, :fundSrc, :trans, :startDate, :provider_id
  json.url child_url(child, format: :json)
end
