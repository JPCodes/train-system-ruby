class City

attr_reader(:id, :name)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO city (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first().fetch('id').to_i
  end

  define_singleton_method(:all) do
    returned_cities = DB.exec('SELECT * FROM city;')
    result =[]
    returned_cities.each() do |city|
      name = city.fetch('name')
      id = city.fetch('id').to_i
      result.push(City.new({:id => id, :name => name}))
    end
    result
  end

  define_method(:==) do |other_city|
    self.name() == other_city.name() && self.id() == other_city.id()
  end

  define_singleton_method(:find) do |identification|
    returned_cities = City.all()
    found_city = nil
    returned_cities.each() do |city|
      if city.id() == identification
        found_city = city
      end
    end
    found_city
  end

  define_method(:update) do |attributes|
    @name = attributes.fetch(:name)
    @id = self.id()
    DB.exec("UPDATE city SET name = '#{@name}' WHERE id = #{@id};")
  end

  define_method(:delete) do
    DB.exec("DELETE FROM city WHERE id = #{self.id()};")
  end

  define_method(:add_train) do |train, time|
    DB.exec("INSERT INTO stops (city_id, train_id, time_of_stop) VALUES (#{self.id}, #{train.id()}, '#{time}');")
  end

  define_method(:find_train) do
    #return all the train_id that stops in the current city.
    city_stops = DB.exec("SELECT train_id FROM stops WHERE city_id =#{self.id};")
    #create an empty array to save train objects
    trains = []
    #iterate through city_stops array.
    city_stops.each do |train|
    #fetch the id
    train_id = train.fetch('train_id').to_i
    #use fetched id to search for the train objects
    # push train objects to empty trains array
    trains.push(Train.find(train_id))
    end
    trains
  end
  
end
