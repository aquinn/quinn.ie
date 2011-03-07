require 'rubygems'
require 'sinatra'

set :environment, :production
set :run, false

require 'quinn'

run Sinatra::Application
