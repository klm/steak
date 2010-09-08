class AcceptanceSpecGenerator < Rails::Generator::NamedBase
  def manifest
    record do |m|
      m.directory File.join('acceptance', class_path)
      file_name.gsub!(/_spec$/,"")
      m.template 'acceptance_spec.rb', File.join('acceptance', class_path, "#{file_name}_spec.rb")
    end
  end
end
