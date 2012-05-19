module Mineralogy
  module Commands
    BIN_PATH = "/etc/init.d/minecraft"

    def self.backup
      "#{bin_path} backup"
    end

    def self.bin_path
      BIN_PATH
    end

    def self.command(mc_command)
      "#{bin_path} command #{mc_command}"
    end

    def self.ls(path)
      "/bin/ls #{path}"
    end

    def self.restart
      "#{bin_path} restart"
    end

    def self.start
      "#{bin_path} start"
    end

    def self.status
      "#{bin_path} status"
    end

    def self.stop
      "#{bin_path} stop"
    end

    def self.symlink_world(world, current)
      "/bin/ln -fs #{world} #{current}"
    end

    def self.update
      "#{bin_path} update"
    end

  end
end
