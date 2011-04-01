require 'rubygems'
require 'sinatra'

require 'pony'
require 'haml'
require 'sass'
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
	name = params[:name]
	email = params[:email]
	comment = strip(params[:comment])
	phone = params[:phone]
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
	"<p>Thanks!</p>"
end

