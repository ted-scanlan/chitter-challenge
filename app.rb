require 'capybara'
require 'sinatra/base'
require 'pg'
require 'date'
require_relative './lib/peep.rb'
require_relative './lib/validation.rb'
require_relative './lib/user.rb'


class Chitter < Sinatra::Base

get '/' do

erb(:index)
end

post '/peep-adding' do

  Peep.create(peep_input: params[:peep_input], time: Time.now)
  redirect '/showpeeps'

end

get '/details' do

  erb(:details)

end

post '/signup' do
  User.create(name: params[:name], email: params[:email], username: params[:username], password: params[:password])
  #is_valid?

redirect '/confirmation'
end

get '/confirmation' do

  erb(:confirmation)

end

get '/showpeeps' do
  @peeps = Peep.all
  erb(:showpeeps)

end


run! if app_file == $0

end
