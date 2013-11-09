module Dynsass
  module Generators
    class CreateStylesheetGenerator < Rails::Generators::Base
      source_root File.expand_path("../../templates", __FILE__)

      def generate_dynsass
        template "dyn_stylesheet.scss.erb", "app/assets/stylesheets/sass/"
        template "dynamic_stylesheet.rb", "lib/classes/dynamic_stylesheet.rb"
      end
    end
  end
end

