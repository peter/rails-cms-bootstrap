class User < ActiveRecord::Base
  has_secure_password

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, format: {with: /@/}

  has_many :change_history, class_name: 'Change'

  def to_s
    name
  end
end
