class Page < ApplicationRecord
  validates :title, presence: true
  validates :site_id, presence: true

  belongs_to :site
  Versioned.add(self, columns: [:title, :body, :doc])

  def widgets
    doc && doc['widgets']
  end

  def widgets=(widgets)
    if widgets.present?
      self.doc = {} if self.doc.blank? || self.doc == '{}'
      self.doc['widgets'] = widgets.reject(&:blank?).map(&:to_i)
    end
  end
end
