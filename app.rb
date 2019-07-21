require 'capybara'
require 'sinatra/base'
require 'pg'
require 'date'
require 'sinatra/flash'
require_relative './lib/peep.rb'
require_relative './lib/validation.rb'
require_relative './lib/user.rb'


class Chitter < Sinatra::Base

  enable :sessions

include EmailValidation
register Sinatra::Flash

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

if is_valid?(params[:email])
      User.create(name: params[:name], email: params[:email], username: params[:username], password: params[:password])
        redirect '/confirmation'
    else
      flash[:notice] = "Error: invalid email"
      redirect '/details'
    end
end


get '/confirmation' do

  erb(:confirmation)

end

get '/showpeeps' do
  @peeps = Peep.all
  erb(:showpeeps)

end

get '/login' do

  erb(:login)

end

post '/searching' do

  user = User.find(username: params[:usernamelogin])
  session[:user_id] = user.id

  redirect '/logincomplete'
end

get '/logincomplete' do 

erb(:logincomplete)

end


run! if app_file == $0

end
