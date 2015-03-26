Rails::TestTask.new("test:features" =>"test:prepare") do |t|
  t.pattern = "test/features/**/*_test.rb"
end

Rake::Task["test:run"].enhance [“test:features"]
