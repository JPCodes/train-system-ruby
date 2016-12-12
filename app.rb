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

get('/admin') do
  erb(:admin)
end

get('/customer') do
  erb(:customer)
end

get('/customer/cities_trains') do
  @all_trains = Train.all()
  erb(:cities_trains)
end

# Adding a new train
get('/train/new') do
  erb(:add_train)
end

post('/neo_train') do
  name = params.fetch('train_input')
  Train.new({:name => name, :id => nil}).save()
  @all_trains = Train.all()
  erb(:cities_trains)
end
# End Adding a new train

# Adding a new city
  get('/city/new') do
    erb(:add_city)
  end

  post('/neo_city') do
    name = params.fetch('city_input')
    City.new({:name => name, :id => nil}).save()
    @all_cities = City.all()
    erb(:cities)
  end
# End Adding a new city

get('/cities') do
  @all_cities = City.all()
  erb(:cities)
end

get('/trains') do
  @all_trains = Train.all()
  erb(:trains)
end

# Adding a city stop to a train route

get('/train/new_city_stop') do
  @all_cities = City.all()
  @all_trains = Train.all()
  erb(:new_city_stop)
end

post('/train_to_city') do
  city = params.fetch('city')
  train = params.fetch('train')
  time_input = params.fetch('time_input')
  city.add_train(train, time_input)
  @all_cities = City.all()
  erb(:cities_trains)
end

# End a city stop to a train route

# # When grabbing from an object
# object_instance.name(), ex: train.name()
#
# # When grabbing from a hash
# tim = ({:name => 'Tim'})
# tim.fetch('name')
#
# # When grabbing from an object while inside a method using attr_reader
# attributes.fetch(:name)
#
# # When grabbing from something else
# From a form
# params.fetch('name')
