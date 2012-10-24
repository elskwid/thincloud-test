require "rails"

module Thincloud
  module Generators
    class TestGenerator < ::Rails::Generators::Base
      source_root File.expand_path("../templates", __FILE__)

      desc "Generates thincloud test infrastructure."
      def test
        generate "mini_test:install"

        empty_directory "test/factories"
        create_file "test/factories/.gitkeep"

        remove_file "test/minitest_helper.rb"
        copy_file "minitest_helper.rb", "test/minitest_helper.rb"

        copy_file "capybara.rb",         "test/support/capybara.rb"
        copy_file "factory_girl.rb",     "test/support/factory_girl.rb"
        copy_file "database_cleaner.rb", "test/support/database_cleaner.rb"
        copy_file "minitest.rb",         "test/support/minitest.rb"
        copy_file "routing_spec.rb",     "test/support/routing_spec.rb"
        copy_file "test.rake", "lib/tasks/test.rake"

        copy_file "Guardfile"

        create_file ".gitignore" unless File.exist?(".gitignore")
        append_file ".gitignore", "coverage"

        say_status "", ""
        say_status "success", "thincloud-test has finished."
      end

    end
  end
end
