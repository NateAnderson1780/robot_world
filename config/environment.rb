require 'bundler' # installs and loads all your gems
Bundler.require   # will call require on anything in your gem file

APP_ROOT = File.expand_path("..", __dir__)  #goes one level up to define root 

# Going into app directory > controllers directory > loads all controller ruby files
Dir.glob(File.join(APP_ROOT, "app", "controllers", "*.rb")).each { |file| require file }

# Going into app directory > models directory > loads all model ruby files
Dir.glob(File.join(APP_ROOT, "app", "models", "*.rb")).each { |file| require file}

class TaskManagerApp < Sinatra::Base
  set :method_override, true
  set :root, APP_ROOT
  set :views, File.join(APP_ROOT, "app", "views")
  set :public_folder, File.join(APP_ROOT, "app", "public")
end