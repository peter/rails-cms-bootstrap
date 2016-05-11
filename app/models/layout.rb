class Layout < ApplicationRecord
  has_many :pages

  def sections
    read_attribute(:sections).try(:map) { |s| s['key'] }
  end

  def sections=(sections)
    section_keys = sections.present? ? sections.split(/,|\s/).map(&:strip).reject(&:blank?) : []
    write_attribute(:sections, section_keys.map { |key| {key: key} })
  end
end
