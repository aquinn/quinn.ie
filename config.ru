require 'rubygems'
require 'sinatra'

set :environment, :production
set :run, false

require File.dirname(__FILE__) + "/quinn.rb" # passenger + bundler gotcha

run Sinatra::Application
