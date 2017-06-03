module AppleSimUtils
  class Cmd
    attr_reader :path

    def initialize
      @path = get_command_path
    end

    def run(*command)
      cmd = ([@path] + command).join(' ')
      sto, ste, status = Open3.capture3(cmd)
      if status.success?
        unless ste.empty?
          puts ste
          return ste
        end
        sto
      else
        puts ste
        raise(sto)
      end
    end

    private

    def get_command_path
      cmd = `which applesimutils`.strip
      return cmd unless cmd.empty?
      raise "You should install applesimutils. Read https://github.com/wix/AppleSimulatorUtils"
    end
  end
end
