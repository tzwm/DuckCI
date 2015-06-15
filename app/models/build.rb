class Build < ActiveRecord::Base
  belongs_to :project
  belongs_to :machines
  has_many :audit_logs

  STATE = {
    wait: "wait",
    building: "building",
    end: "end"
  }

  def pretty_commit n=7
    self.commit[0..n]
  end

  def commit_url
    self.project.uri + "/commit/#{self.commit}"
  end
end
