class ApisController < ApplicationController
  
  def request_encode
    json_response = {"msg"=>"REQUEST ACCEPTED","code"=>"200"}   
    
    job = Job.new
    job.input_name        = params["input_name"]
    job.length_in_seconds = params["length"]
    job.size_in_mb        = params["size"]
    job.status            = "WAITING"
    job.owner             = params["callback"]
    job.machine_id        = select_machine.id
    
    for style in params["styles"]
      #to-do: create video artifacts
    end
    
    job.save!
    
    respond_to do |format|
      format.json {render :json => json_response}
    end
  end
  
  
  #temporary method to select the best machine to process the video
  def select_machine
    Machine.first
  end

end