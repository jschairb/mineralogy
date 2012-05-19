require 'spec_helper'

module Mineralogy
  describe Commands do
    describe ".bin_path" do
      it "returns the bin path" do
        Commands.bin_path.should == Commands::BIN_PATH
      end
    end

    describe ".backup" do
      it "returns the backup command" do
        Commands.backup.should include(" backup")
      end
    end

    describe ".command" do
      context "given a mc server command" do
        it "returns the command command" do
          Commands.command("help").should include(" command help")
        end
      end
    end

    describe ".restart" do
      it "returns the restart command" do
        Commands.restart.should include(" restart")
      end
    end

    describe ".start" do
      it "returns the start command" do
        Commands.start.should include(" start")
      end
    end

    describe ".status" do
      it "returns the status command" do
        Commands.status.should include(" status")
      end
    end

    describe ".stop" do
      it "returns the stop command" do
        Commands.stop.should include(" stop")
      end
    end

    describe ".symlink_world" do
      context "given a world directory and the current directory" do
        it "symlinks the world to current" do
          Commands.symlink_world("my-world", "minecraft").
            should == "/bin/ln -fs my-world minecraft"
        end
      end
    end

    describe ".update" do
      it "returns the update command" do
        Commands.update.should include(" update")
      end
    end

  end
end

