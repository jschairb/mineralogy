require 'net/ssh'

module Mineralogy
  class Server
    attr_accessor :host, :username, :password

    def initialize(args={})
      args.each {|k,v| send("#{k}=".intern, v)}
    end

    def backup
      execute("/etc/init.d/minecraft backup")
    end

    def command(mc_command)
      execute("/etc/init.d/minecraft command #{mc_command}")
    end

    def restart
      execute("/etc/init.d/minecraft restart")
    end

    def start
      execute("/etc/init.d/minecraft start")
    end

    def status
      execute("/etc/init.d/minecraft status")
    end

    def stop
      execute("/etc/init.d/minecraft stop")
    end

    def update
      execute("/etc/init.d/minecraft update")
    end

    private

    def execute(*commands)
      Net::SSH.start(host, username, :password => password) do |ssh|
        @output = commands.collect {|c| ssh.exec!(c)}
      end

      @output.join("")
    end
  end
end
