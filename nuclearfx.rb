require 'sinatra'
set :port, 80
set :logging, false
set :environment, :production

get '/' do
	erb :description
end

get '/contacts' do
	erb :contacts
end

get '/services' do
	erb :services
end

get '/faq' do
	time1 = Time.new
	open('faqreading.logg', 'a') do |f|
  f.puts time1.inspect+'@'+request.ip
	end
	erb :faq
end

get '/feedback' do
	erb :feedback
end

get '/description' do
	erb :description
end

post '/proceed' do
	erb :thanks
end

post '/login' do

	erb :error
end

post '/request' do
	name = params['name']
	email = params['email']
	comment = params['comment']
	time1 = Time.new
	open('messages.logg', 'a') do |f|
  f.puts name +':'+email+'$'+comment+'::'+time1.inspect+'@'+request.ip
	end
	erb :thanks
end
