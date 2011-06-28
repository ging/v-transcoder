class Job < ActiveRecord::Base
  has_many :video_artifacts
  belongs_to :machine
end