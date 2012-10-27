set :application, 'currencytracker'
set :repository, 'git@github.com:rilian/CurrencyTracker.git'

set :rails_env, 'production'
default_environment["RAILS_ENV"] = 'production'
set :normalize_asset_timestamps, false

set :scm, :git
set :git_enable_submodules, true

set :production_server, '172.16.41.113'
role :web, production_server
role :app, production_server
role :db, production_server, :primary => true

# target
set :deploy_to, '/home/rails/apps/currencytracker'

set :user, 'rails'
set :group, 'rails'
set :use_sudo, false

# use bundler
require 'bundler/capistrano'

# use rvm
require 'rvm/capistrano'
set :rvm_ruby_string, '1.9.3'
set :rvm_type, :system

namespace :rvm do
  task :trust_rvmrc do
    run "rvm rvmrc trust #{release_path}"
  end
end
after 'deploy', 'rvm:trust_rvmrc'
after 'deploy:finalize_update', 'deploy:config'

# forward ssh auth
ssh_options[:forward_agent] = true

set :unicorn_pid, '/tmp/unicorn-currencytracker.pid'

namespace :deploy do
  desc "Deploy production configs"
  task :config do
    run <<-CMD
ln -sf #{shared_path}/database.yml #{latest_release}/config/database.yml
    CMD
  end

  desc "Down-up restart of Unicorn"
  task :restart, :except => { :no_release => true } do
  run "kill -s HUP `cat #{unicorn_pid}`"
  end

  desc "Start unicorn"
  task :start, :except => { :no_release => true } do
  run "cd #{current_path} ; bundle exec unicorn_rails -c config/unicorn.rb -D"
  end

  desc "Stop unicorn"
  task :stop, :except => { :no_release => true } do
  run "kill -s QUIT `cat #{unicorn_pid}`"
  end
end

after 'deploy:update_code', 'deploy:migrate'
