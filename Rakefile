require 'rubocop/rake_task'
require 'foodcritic'
require 'rspec/core/rake_task'

RuboCop::RakeTask.new(:rubocop)
FoodCritic::Rake::LintTask.new(:foodcritic)
RSpec::Core::RakeTask.new(:rspec)

begin
  require 'kitchen/rake_tasks'
  Kitchen::RakeTasks.new

  desc 'Alias for kitchen:all'
  task all: 'kitchen:all'

rescue LoadError
  puts '>>>>> Kitchen gem not loaded, omitting tasks' unless ENV['CI']
end

task tests: [:rubocop, :foodcritic, :rspec]

task kitchen: [:all]

task default: [:tests, :kitchen]
