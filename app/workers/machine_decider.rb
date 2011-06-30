require 'net/http'

class MachineDecider
  
  @queue = :machine_decider_queue
  
  def self.perform(job_id)
    job = Job.find(job_id)
    job.machine_id = self.select_machine.id
    job.save!
    
    machine = Machine.find(job.machine_id)

    uri = URI.parse(job.owner)   
    Net::HTTP::post_form(uri,{ 'type' => 'ENCODE_AT', 
                               'code'     => job.code,
                               'node_url'    => machine.id})
  end
  
  #temporary method to select the best machine to process the video
  class << self 
    def select_machine
      Machine.first #the algorithm is very complex
    end
  end
  
end