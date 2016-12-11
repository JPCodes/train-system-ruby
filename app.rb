require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/city')
require('./lib/train')
require('pg')

DB = PG.connect({:dbname => 'train_system_test'})

get('/') do
  erb(:index)
end

get('/customer') do
  erb(:customer)
end

get('/customer/cities_trains') do
  @all_trains = Train.all()
  erb(:cities_trains)
end
