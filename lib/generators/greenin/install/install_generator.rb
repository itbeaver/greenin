module Greenin
  # Public: Add generator to project.
  # Generator copies initializer to app
  #
  # Example:
  #
  #   rails g greenin:install
  class InstallGenerator < Rails::Generators::Base
    source_root File.expand_path('../templates', __FILE__)
    desc 'This generator creates an initializer file at config/initializers'
    def create_initializer_file
      copy_file 'initializer.rb', 'config/initializers/greenin_initializer.rb'
    end
  end
end
