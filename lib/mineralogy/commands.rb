module Mineralogy
  module Commands
    def self.bin_path
      "/etc/init.d/minecraft"
    end

    def self.start
      "#{bin_path} start"
    end

    def self.stop
      "#{bin_path} stop"
    end

    def self.symlink_world(world, current)
      "/bin/ln -fs #{world} #{current}"
    end
  end
end
