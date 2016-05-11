json.array!(@layouts) do |layout|
  json.extract! layout, :id, :name, :sections
  json.url layout_url(layout, format: :json)
end
