module AppleSimUtils
  class Cmd
    attr_reader :path, :bundle_id

    def initialize(bundle_id: nil)
      @path = get_command_path
      @bundle_id = bundle_id
    end

    def allow_all(device:, permissions:)
      raise 'You should set bundle_id' if @bundle_id.nil?

      p = permissions.map {|permission| permission + '=YES'}.join(',')
      run(%(--simulator '#{device}' --bundle #{@bundle_id} --setPermissions '#{p}'))
    end

    def deny_all(device:, permissions:)
      raise 'You should set bundle_id' if @bundle_id.nil?

      p = permissions.map {|permission| permission + '=NO'}.join(',')
      run(%(--simulator '#{device}' --bundle #{@bundle_id} --setPermissions '#{p}'))
    end

    def set(device:, permission:, value:)
      run(%(--simulator '#{device}' --bundle #{@bundle_id} --setPermissions '#{permission}=#{value}'))
    end

    def restart(device:)
      run(%(--simulator '#{device}' --restartSB))
    end

    def run(*command)
      return command.join(' ') if ENV['DRY_RUN']
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
      raise 'You should install applesimutils. Read https://github.com/wix/AppleSimulatorUtils'
    end
  end
end
