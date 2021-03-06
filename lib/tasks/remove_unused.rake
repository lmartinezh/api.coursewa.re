# Cleanup unused rake tasks
Rake::TaskManager.class_eval do
  def remove_task(task_name)
    @tasks.delete(task_name.to_s)
  end
end

%w(
  test test:single test:uncommitted test:recent
  db:seed db:fixtures:load
  doc:app
).each do |task|
  Rake.application.remove_task task
end

# Do not run migrations if in production, non API app should handle those
Rake.application.remove_task('db:migrate') if Rails.env.production?
