require 'rails/generators'
require 'active_support/inflector/inflections'

module Steak
  class SpecGenerator < Rails::Generators::NamedBase
    source_root File.join(File.dirname(__FILE__), 'templates')

    desc <<-DESC
Description:
    Create an acceptance spec for the feature NAME in the
    'acceptance' folder.

Example:
    `rails generate steak:spec checkout`

    Creates an acceptance spec for the "checkout" feature:
        acceptance/checkout_spec.rb
DESC

    def manifest
      empty_directory File.join('acceptance', class_path)
      file_name.gsub!(/_spec$/, "")

      @feature_name  = file_name.titleize
      @relative_path = "../" * class_path.size
      
      target = File.join('acceptance', class_path, 
                         "#{file_name}_spec.rb")

      template 'acceptance_spec.rb', target
    end
  end
end
