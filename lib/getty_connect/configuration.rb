require 'yaml'

module GettyConnect
  module Configuration

    def self.load(path_to_yaml_file)
      begin
        configuration = YAML::load(IO.read(path_to_yaml_file))
        @id = configuration['id']
        @secret = configuration['secret']
        @username = configuration['username']
        @password = configuration['password']
        return
      rescue Errno::ENOENT
        raise "YAML configuration file \"#{path_to_yaml_file}\" couldn't be found. Using defaults."
      rescue Psych::SyntaxError
        raise "YAML configuration file contains invalid syntax. Using defaults."
      end
    end

    def self.id
      @id
    end

    def self.secret
      @secret
    end

    def self.username
      @username
    end

    def self.password
      @password
    end

    def self.reset
      @id = nil
      @secret = nil
      @username = nil
      @password = nil
    end

  end
end
