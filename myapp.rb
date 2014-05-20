require 'sinatra'

class Myapp < Sinatra::Base
  get '/' do
    erb :index, :locals =>{:greeting => "HELLO"}
  end

get '/delete' do

  `rm ./views/index.erb`
end

get '/ls' do
  return `ls -al views`
end

get '/env' do
return ENV.inspect
end


end



