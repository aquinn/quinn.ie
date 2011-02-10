set :user, "andy"
set :use_sudo, :false
set :application, "quinn.ie"
set :repository,  "."
set :scm, :git
set :deploy_via, :copy
set :branch, "master"
set :deploy_to, "/home/andy/public_html/#{application}"
#set :deploy_env, 'production'
set :app_server, :passenger
#set :server_name. "quinn.ie"

task :fix_permissions do
   run "sudo chown -R andy:andy /home/andy/public_html" 
end
after("deploy:setup", "fix_permissions")

task :production do
   role :web, "quinn.ie"
   role :app, "quinn.ie"
   role :db, "quinn.ie", :primary => true
end

task :staging do
   role :web, "192.168.2.4"
   role :app, "192.168.2.4"
   role :db, "192.168.2.4", :primary => true
end

default_run_options[:pty] = true

namespace :deploy do
   task :restart do
      run "touch #{deploy_to}/tmp/restart.txt"
   end

   task :start do
      run "touch #{deploy_to}/tmp/restart.txt"
   end
end
