require "capify-ec2/capistrano"

set :application, "OnlineCodeEditor"
set :repository,  "git@github.com:samiur/OnlineCodeEditor.git"

set :scm, :git
set :branch, "master"

set :ssh_options, { :forward_agent => true }
set :user, "ec2-user"
set :use_sudo, true
set :deploy_to, "/var/www/#{application}"

ssh_options[:forward_agent] = true
ssh_options[:keys] = ["~/.ssh/samiurrkey.pem"]
default_run_options[:pty] = true

# The address of the remote host on EC2 (the Public DNS address)
set :location, "54.214.23.195"
# The deploy user's password
# You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

ec2_roles :web

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end
