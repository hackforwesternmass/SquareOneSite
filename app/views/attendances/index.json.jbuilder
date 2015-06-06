json.array!(@attendances) do |attendance|
  json.extract! attendance, :id, :child_id, :provider_id, :childTermDate, :dateOfService, :timeIn, :timeOut, :absent, :whoCreated, :dateCreated, :whoEdited, :dateEdited
  json.url attendance_url(attendance, format: :json)
end
