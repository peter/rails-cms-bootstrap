class Change < ApplicationRecord
  belongs_to :user

  validates :controller, presence: true
  validates :action, presence: true
  validates :params, presence: true

  serialize :params, JSON
  serialize :model_attributes, JSON

  def to_s
    "#{controller}/#{action}"
  end
end
