set :application, "quinn.ie"
set :repository,  "."
set :server_name, "109.74.198.151"
set :scm, :git
set :deploy_via, :export
set :branch, "master"
set :deploy_to, "/home/aquinn/public_html/#{application}"
set :user, 'aquinn'
set :app_server, :passenger
set :use_sudo, false
set :stage, :production

role :web, server_name                          # Your HTTP server, Apache/etc
role :app, server_name                         # This may be the same as your `Web` server
role :db,  server_name, :primary => true # This is where Rails migrations will run

# If you are using Passenger mod_rails uncomment this:
# if you're still using the script/reapear helper you will need
# these http://github.com/rails/irs_process_scripts
#default_run_options[:pty] = true 


namespace :passenger do
   desc "Restart Application"
   task :restart do
      run "touch #{current_path}/tmp/restart.txt"
   end
end
after :deploy, "passenger:restart"
