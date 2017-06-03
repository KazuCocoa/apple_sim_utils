module AppleSimUtils
  class Cmd
    attr_reader :path

    def initialize
      @path = get_command_path
    end

    private

    def run(*command)
      cmd = command.join(' ')
      sto, ste, status = Open3.capture3(cmd)
      if status.success?
        sto
      else
        puts ste
        raise(sto)
      end
    end

    def get_command_path
      cmd = `which applesimutils`.strip
      return cmd unless cmd.empty?
      raise "You should install applesimutils. Read https://github.com/wix/AppleSimulatorUtils"
    end

    protected

    def method_missing(method, *args, &_block)
      if respond_to_missing?
        run(%W(#{@path} #{method}) + args)
      else
        super
      end
    end

    def respond_to_missing?
      true
    end
  end
end
