json.array!(@sites) do |site|
  json.extract! site, :id, :key
  json.url site_url(site, format: :json)
end
