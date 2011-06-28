class Job < ActiveRecord::Base
  has_many :video_artifacts
end