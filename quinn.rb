require 'sass'

get '/' do
   # grab from polish, irish and german fortunes
   fortune = `/usr/games/fortune -aes pl de ga`
   haml :index, :locals => {:fortune => fortune }
end 

get '/stylesheets/style.css' do
   sass :style
end
