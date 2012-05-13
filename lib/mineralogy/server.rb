require 'net/ssh'

module Mineralogy
  class Server
    attr_accessor :host, :username, :password

    WORLDS_PATH = "/home/minecraft/mc-worlds"

    def initialize(args={})
      args.each {|k,v| send("#{k}=".intern, v)}
    end

    def backup
      execute("#{bin_path} backup")
    end

    def bin_path
      self.class.bin_path
    end

    def command(mc_command)
      execute("#{bin_path} command #{mc_command}")
    end

    def restart
      execute("#{bin_path} restart")
    end

    def start
      execute(Commands.start)
    end

    def status
      execute("#{bin_path} status")
    end

    def stop
      execute(Commands.stop)
    end

    def switch_worlds(world)
      commands = [stop_command, symlink_world(world), start_command]
      execute(commands)
    end

    def symlink_world(world)
      execute(Commands.symlink_world(world))
    end

    def update
      execute("#{bin_path} update")
    end

    def worlds
      worlds = execute("/bin/ls #{worlds_path}")
      worlds.split("\n")
    end

    def worlds_path
      self.class.worlds_path
    end

    private

    def execute(*commands)
      self.class.execute(host, username, password, *commands)
    end

    def self.bin_path
      Commands.bin_path
    end

    def self.execute(host, username, password, *commands)
      Net::SSH.start(host, username, :password => password) do |ssh|
        @output = commands.collect {|c| ssh.exec!(c)}
      end

      @output.join("")
    end

    def self.worlds_path
      WORLDS_PATH
    end
  end
end
