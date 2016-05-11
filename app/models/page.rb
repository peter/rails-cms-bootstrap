class Page < ApplicationRecord
  validates :title, presence: true
  validates :site_id, presence: true
  validates :path, presence: true

  belongs_to :site
  belongs_to :layout
  has_many :published_paths, as: :item
  Versioned.add(self, columns: [:title, :path, :body, :doc, :status, :publish_at, :unpublish_at])

  before_validation :set_default_status
  before_validation :set_default_path
  before_validation :set_normalized_path
  before_validation :check_path_unique
  after_save :save_published_path

  def published?
    status == 'published'
  end

  def widgets
    doc && doc['widgets']
  end

  def widgets=(widgets)
    if widgets.present?
      self.doc = {} if self.doc.blank? || self.doc == '{}'
      self.doc['widgets'] = widgets.reject(&:blank?).map(&:to_i)
    end
  end

  def set_default_status
    self.status ||= 'draft'
  end

  def set_default_path
    self.path ||= Path.default_path(title, site_id)
  end

  def set_normalized_path
    self.path = Path.normalize_path(path)
  end

  def check_path_unique
    if path && path_changed? && PublishedPath.exists?(path: path, site_id: site_id)
      self.errors.add(:path, "Already exists")
    end
  end

  def save_published_path
    if (path_changed? && published?) || (status_changed? && published?)
      published_paths.create!(path: path, site_id: site_id)
    end
  end
end
