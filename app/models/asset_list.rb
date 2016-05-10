class AssetList < Widget
  # http://stackoverflow.com/questions/4507149/best-practices-to-handle-routes-for-sti-subclasses-in-rails
  def self.model_name
    Widget.model_name
  end
end
