class PublishedPath < ApplicationRecord
  belongs_to :item, polymorphic: true
end
