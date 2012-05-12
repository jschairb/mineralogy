require 'spec_helper'

module Mineralogy
  describe Server do 
    before do
      Net::SSH.stub!(:start).and_yield(session)
    end

    let(:session) { mock("session") }

    describe "backup" do
    end

    describe "command" do
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
      before do
        session.stub!(:exec! => response)
      end

      let(:response) { "Stopping minecraft_server.jar\nminecraft_server.jar is stopped.\nStarting minecraft_server.jar...\nminecraft_server.jar is now running." }

      let(:server) { Server.new }

      it "restarts the server" do 
        session.should_receive(:exec!).with("/etc/init.d/minecraft restart")
        server.restart
      end

      it "returns the response" do 
        server.restart.should == response
      end
    end

    describe "start" do 
    end

    describe "status" do 
    end

    describe "stop" do 
      before do
        session.stub!(:exec! => response)
      end

      let(:response) { "Stopping minecraft_server.jar\nminecraft_server.jar is stopped." }

      let(:server) { Server.new }

      it "stops the server" do 
        session.should_receive(:exec!).with("/etc/init.d/minecraft stop")
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
