require 'rubygems'
require 'sinatra'

require 'pony'
require 'haml'
require 'yaml'



get '/' do
   haml :index 
end 


get '/stylesheets/style.css' do
   sass :style
end

def strip(str)
   return str.gsub(/<\/?[^>]*>/, "")
end

post '/comment' do
	$this_dir = Pathname.new(File.dirname(__FILE__))
	Yml = YAML.load_file "config/config.yml"
	name = strip(params[:name])
	email = strip(params[:email])
	comment = strip(params[:comment])
	phone = strip(params[:phone])
	Pony.mail(
	:to => 'andy@quinn.ie',
	:from => "#{email}",
	:subject => "Website query from #{name}", 
	:body => "Phone no: #{phone} -- Query: #{comment}",
	:via => :smtp, 
	:via_options => {
			:address        => "smtp.sendgrid.net",
			:port           => "25",
			:authentication => :plain,
			:user_name      => Yml['sendgrid']['user_name'],
			:password       => Yml['sendgrid']['password'],
			:domain         => 'quinn.ie'
	})
	redirect '/'
end

