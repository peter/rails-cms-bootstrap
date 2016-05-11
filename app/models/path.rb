module Path
  def self.normalize_path(path)
    path.try(:parameterize)
  end

  def self.default_path(title, site_id, options = {})
    return nil if title.blank?
    suffix = options[:sequence] ? "-#{options[:sequence]}" : ''
    path = normalize_path(title) + suffix
    if PublishedPath.exists?(path: path, site_id: site_id)
      next_sequence = (options[:sequence] || 1) + 1
      default_path(title, site_id, sequence: next_sequence)
    else
      return path
    end
  end
end
