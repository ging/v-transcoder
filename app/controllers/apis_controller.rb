class ApisController < ApplicationController
  
  def request_encode
    json_response = {"msg"=>"REQUEST ACCEPTED","code"=>"200"}   
    
    respond_to do |format|
      format.json {render :json => json_response}
    end
  end

end