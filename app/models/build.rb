class Build < ActiveRecord::Base
  belongs_to :project

  STATE = {
    wait: "wait",
    building: "building",
    end: "end"
  }
end
