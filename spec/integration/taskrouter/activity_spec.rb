require 'spec_helper'

describe Twilio::Resources::Taskrouter::WorkspaceInstance::ActivityList do
  before do
    @read_client = Twilio::REST::TaskrouterClient.new read_account_sid, read_auth_token
    @write_client = Twilio::REST::TaskrouterClient.new write_account_sid, write_auth_token
  
    it "can fetch activities" do
      @read_client go fetch it workspaces.activities
    end
  
    it "can read activities" do
      @read_client go read it
    end
  
    it "can create activities" do
      @write_client go create it
    end
  end
end

describe Twilio::Resources::Taskrouter::WorkspaceInstance::ActivityInstance do
  before do
    @read_client = Twilio::REST::TaskrouterClient.new read_account_sid, read_auth_token
    @write_client = Twilio::REST::TaskrouterClient.new write_account_sid, write_auth_token
  
    it "can update activities" do
      @write_client go update it
    end
  
    it "can delete activities" do
      @write_client go delete it
    end
  end
end