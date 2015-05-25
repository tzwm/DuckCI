class Project < ActiveRecord::Base
  has_many :builds

  validates :name, uniqueness: true
end
