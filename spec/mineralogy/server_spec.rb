require 'spec_helper'

module Mineralogy
  describe Server do 
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
    end

    describe "start" do 
    end

    describe "status" do 
    end

    describe "stop" do 
    end

    describe "update" do
    end
  end
end
