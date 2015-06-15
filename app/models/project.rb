class Project < ActiveRecord::Base
  has_many :builds
  has_many :audit_logs

  validates :name, uniqueness: true
end
