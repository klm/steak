require 'rspec/core/rake_task'

namespace :spec do
  desc "Run the code examples in acceptance"
  RSpec::Core::RakeTask.new(:acceptance => "db:test:prepare") do |t|
    t.pattern = "acceptance/**/*_spec.rb"
  end

  task :statsetup do
    require 'rails/code_statistics'
    ::STATS_DIRECTORIES << %w(Acceptance\ specs acceptance) if File.exist?('acceptance')
    ::CodeStatistics::TEST_TYPES << "Acceptance specs" if File.exist?('acceptance')
  end
end
