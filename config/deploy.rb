# Looks at github.com/aquinn/quinn.ie.git and copies it to linode server

set :project, "quinn.ie"
set :application, "quinn.ie"
set :repository,  "git@github.com:aquinn/quinn.ie.git"
set :server_name, "78.47.136.194"
set :scm, :git
set :deploy_via, :remote_cache
set :branch, "master"
set :deploy_to, "/home/aquinn/public/#{application}"
set :user, 'aquinn'
set :app_server, :passenger
set :use_sudo, false
set :stage, :production
set :scm_verbose, true

role :web, server_name                
role :app, server_name                         
role :db,  server_name, :primary => true 


namespace :deploy do
	task :restart do
		run "touch #{current_path}/tmp/restart.txt"
	end

	task :symlink_shared do
		run "ln -nfs #{shared_path}/config/config.yml #{release_path}/config/config.yml"
	end
end

after 'deploy:update_code', 'deploy:symlink_shared'
