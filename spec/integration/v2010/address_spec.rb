require 'spec_helper'

describe Twilio::Resources::V2010::AccountInstance::AddressList do
  before do
    @read_client = Twilio::REST::Client.new read_account_sid, read_auth_token
    @write_client = Twilio::REST::Client.new write_account_sid, write_auth_token
  
    it "can create addresses" do
      @write_client go create it
    end
  
    it "can fetch addresses" do
      @read_client go fetch it accounts.addresses
    end
  
    it "can read addresses" do
      @read_client go read it
    end
  end
end

describe Twilio::Resources::V2010::AccountInstance::AddressInstance do
  before do
    @read_client = Twilio::REST::Client.new read_account_sid, read_auth_token
    @write_client = Twilio::REST::Client.new write_account_sid, write_auth_token
  
    it "can delete addresses" do
      @write_client go delete it
    end
  
    it "can update addresses" do
      @write_client go update it
    end
  end
end