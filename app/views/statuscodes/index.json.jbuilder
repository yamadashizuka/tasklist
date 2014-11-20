json.array!(@statuscodes) do |statuscode|
  json.extract! statuscode, :id, :name
  json.url statuscode_url(statuscode, format: :json)
end
