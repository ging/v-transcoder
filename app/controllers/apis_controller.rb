class ApisController < ApplicationController
  
  def request_encode
    json_response = {"type"=>"REQUEST_ACCEPTED",
                     "code"=>"200",
                     "msg"=>"Wait for info about the machine that will encode your video."}   
    
    job = Job.new
    job.code              = params["code"]
    job.input_name        = params["input"]
    job.length_in_seconds = params["length"]
    job.size_in_mb        = params["size"]
    job.status            = "WAITING"
    job.owner             = params["callback"]
    job.machine_id        = nil
    job.save!
    
    Resque.enqueue(MachineDecider,job.id)
    
    for style in params["styles"]
      video_artifact = VideoArtifact.new
      video_artifact.name = style["name"]
      video_artifact.output = style["output"]
      video_artifact.params = style["params"].to_json
      video_artifact.job_id = job.id
      video_artifact.save!
    end
    
    respond_to do |format|
      format.json {render :json => json_response}
    end
  end
  
end