require 'net/ssh'

module Mineralogy
  class Server
    attr_accessor :host, :username, :password

    BIN_PATH = "/etc/init.d/minecraft"

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
      execute("#{bin_path} start")
    end

    def status
      execute("#{bin_path} status")
    end

    def stop
      execute("#{bin_path} stop")
    end

    def update
      execute("#{bin_path} update")
    end

    private

    def execute(*commands)
      self.class.execute(host, username, password, *commands)
    end

    def self.bin_path
      BIN_PATH
    end

    def self.execute(host, username, password, *commands)
      Net::SSH.start(host, username, :password => password) do |ssh|
        @output = commands.collect {|c| ssh.exec!(c)}
      end

      @output.join("")
    end
  end
end
