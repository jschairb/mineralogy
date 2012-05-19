require 'net/ssh'

module Mineralogy
  class Server
    attr_accessor :host, :username, :password

    WORLDS_PATH = "/home/minecraft/mc-worlds"

    def initialize(args={})
      args.each {|k,v| send("#{k}=".intern, v)}
    end

    def backup
      execute(Commands.backup)
    end

    def bin_path
      self.class.bin_path
    end

    def command(mc_command)
      execute(Commands.command(mc_command))
    end

    def restart
      execute(Commands.restart)
    end

    def start
      execute(Commands.start)
    end

    def status
      execute(Commands.status)
    end

    def stop
      execute(Commands.stop)
    end

    def switch_worlds(world)
      commands = [Commands.stop, Commands.symlink_world(world), Commands.start]
      execute(commands)
    end

    def symlink_world(world)
      execute(Commands.symlink_world(world))
    end

    def update
      execute(Commands.update)
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
        server_commands = commands.join(" && ")
        @output = ssh.exec!(server_commands)
      end

      @output.join("")
    end

    def self.worlds_path
      WORLDS_PATH
    end
  end
end
