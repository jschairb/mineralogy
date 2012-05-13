require 'spec_helper'

module Mineralogy
  describe Server do 
    before do
      Server.stub!(:execute).and_return(response)
    end

    let(:response) { "Generic response received..." }
    let(:server) { Server.new }

    describe "#backup" do

      let(:response) { "Backing up server..." }

      it "backs up the server" do
        Server.should_receive(:execute).with(anything, anything, anything, "#{server.bin_path} backup").
          and_return(response)
        server.backup
      end

      it "returns the response" do 
        server.backup.should == response
      end
    end

    describe "#bin_path" do 
      it "returns the class bin path" do 
        server.bin_path.should == Server.bin_path
      end
    end

    describe "#command" do
    end

    describe "#new" do 
      it "sets the host" do 
        server = Server.new(:host => "127.0.0.1")
        server.host.should == "127.0.0.1"
      end

      it "sets the password" do 
        server = Server.new(:password => "secret")
        server.password.should == "secret"
      end

      it "sets the username" do 
        server = Server.new(:username => "miner")
        server.username.should == "miner"
      end
    end

    describe "#restart" do 
      let(:response) { "Restarting the server..." }

      it "restarts the server" do 
        Server.should_receive(:execute).with(anything, anything, anything, "#{server.bin_path} restart")
        server.restart
      end

      it "returns the response" do 
        server.restart.should == response
      end
    end

    describe "start" do 
      let(:response) { "Starting minecraft_server.jar\nminecraft_server.jar is started." }

      it "starts the server" do 
        Server.should_receive(:execute).with(anything, anything, anything, "#{server.bin_path} start")
        server.start
      end

      it "returns the response" do 
        server.start.should == response
      end
    end

    describe "status" do 
      let(:response) { "Server is running..." }

      it "queries the server for status" do 
        Server.should_receive(:execute).with(anything, anything, anything, "#{server.bin_path} status")
        server.status
      end

      it "returns the response" do 
        server.status.should == response
      end
    end

    describe "stop" do 
      let(:response) { "Stopping minecraft_server.jar\nminecraft_server.jar is stopped." }

      it "stops the server" do 
        Server.should_receive(:execute).with(anything, anything, anything, "#{server.bin_path} stop")
        server.stop
      end

      it "returns the response" do 
        server.stop.should == response
      end
    end

    describe "update" do
    end
  end
end
