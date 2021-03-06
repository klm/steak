unless ARGV.any? {|a| a =~ /^gems/} # Don't load anything when running the gems:* tasks

require 'spec/rake/spectask'

namespace :spec do
  desc "Run the code examples in acceptance"
  Spec::Rake::SpecTask.new(:acceptance => "db:test:prepare") do |t|
    t.spec_opts = ['--options', "\"#{RAILS_ROOT}/spec/spec.opts\""]
    t.spec_files = FileList["acceptance/**/*_spec.rb"]
  end

  # Setup stats to include acceptance specs
  task :statsetup do
    require 'code_statistics'
    ::STATS_DIRECTORIES << %w(Acceptance\ specs acceptance) if File.exist?('acceptance')
    ::CodeStatistics::TEST_TYPES << "Acceptance specs" if File.exist?('acceptance')
  end
end
end
