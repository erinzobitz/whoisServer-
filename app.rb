require "sinatra"
require "whois"
require "sinatra/reloader"

set :public_folder, File.dirname(__FILE__) + '/public'

get '/' do
  erb :index
end

get '/whois' do
	puts params
	w = Whois::Client.new
	@state = "unavailable"
	@domain = params[:domain]
	result = w.query(@domain)

	@state = "available" if result.available?

	erb :result
end


