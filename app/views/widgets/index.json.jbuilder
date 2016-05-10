json.array!(@widgets) do |widget|
  json.extract! widget, :id, :type, :title, :body
  json.url widget_url(widget, format: :json)
end
