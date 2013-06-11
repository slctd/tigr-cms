set_default(:mongoid_database) { "#{application}_production" }

namespace :mongoid do
  desc "Generate the database.yml configuration file."
  task :setup, roles: :app do
    run "mkdir -p #{shared_path}/config"
    template "mongoid.yml.erb", "#{shared_path}/config/mongoid.yml"
  end
  after "deploy:setup", "mongoid:setup"

  desc "Symlink the mongoid.yml file into latest release"
  task :symlink, roles: :app do
    run "ln -nfs #{shared_path}/config/mongoid.yml #{release_path}/config/mongoid.yml"
    run "ln -nfs #{shared_path}/ckeditor_assets #{release_path}/public/ckeditor_assets"
  end
  after "deploy:finalize_update", "mongoid:symlink"
end
