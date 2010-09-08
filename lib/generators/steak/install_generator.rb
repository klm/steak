require 'rails/generators'

module Steak
  class InstallGenerator < Rails::Generators::Base
    class_option :webrat, :desc => 'Use Webrat.', :type => :boolean
    class_option :capybara, :desc => 'Use Capybara.', :type => :boolean

    source_root File.join(File.dirname(__FILE__), 'templates')

    desc <<-DESC
Description:
    Sets up Steak in your Rails project. This will generate the
    acceptance directory and the necessary files.

    If you haven't already, You should also run
    `rails generate rspec:install` to complete the set up.

Examples:
    `rails generate steak:install`
DESC

    def initialize(args=[], options={}, config={})
      puts "Defaulting to Capybara..." if options.empty?
      super
    end

    def manifest
      empty_directory 'spec/controllers'
      empty_directory 'acceptance/support'
      template "acceptance_helper.rb", "acceptance/acceptance_helper.rb"
      copy_file "helpers.rb",           "acceptance/support/helpers.rb"
      copy_file "paths.rb",             "acceptance/support/paths.rb"
    end

    def driver
      @driver = options.webrat? ? 'webrat' : 'capybara'
    end
  end
end
