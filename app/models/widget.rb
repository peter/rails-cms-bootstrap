class Widget < ApplicationRecord
  def self.descendants
    # NOTE: does not work in development with lazy loaded classes
    # ObjectSpace.each_object(Class).select { |klass| klass < self }
    [AssetList]
  end
end
