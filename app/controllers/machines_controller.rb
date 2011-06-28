class MachinesController < InheritedResources::Base
  def destroy
    @machine = Machine.find(params[:id])
    @machine.destroy
    redirect_to machines_url, :notice => "Successfully destroyed machine."
  end
end
