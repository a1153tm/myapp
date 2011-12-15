set :application, "myapp"
set :deploy_to,  "/Users/rails/myapp"

#set :scm, :subversion
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`
set :repository,  "git@github.com:a1153tm/myapp"
set :scm, :git

set :use_sudo, false

#role :web, "your web-server here"                          # Your HTTP server, Apache/etc
#role :app, "your app-server here"                          # This may be the same as your `Web` server
#role :db,  "your primary db-server here", :primary => true # This is where Rails migrations will run
#role :db,  "your slave db-server here"
role :web, "localhost"
role :app, "localhost"
role :db,  "localhost", :primary => true

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end
