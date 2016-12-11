class Train

attr_reader(:id, :name)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO train (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first().fetch('id').to_i
  end

  define_singleton_method(:all) do
    returned_trains = DB.exec("SELECT * FROM train;")
    all_trains = []
    returned_trains.each do |train|
      name = train.fetch('name')
      id = train.fetch('id').to_i
      all_trains.push(Train.new({:id => id, :name => name}))
    end
    all_trains
  end


  define_method(:add_city) do |city, time|
    DB.exec("INSERT INTO stops (city_id, train_id, time_of_stop) VALUES (#{city.id()}, #{self.id()}, '#{time}');")
  end

  define_method(:find_stops) do
    # Returns all city_ids a train stops through
    train_stops = DB.exec("SELECT city_id FROM stops WHERE train_id = #{self.id()}")
    # Create empty array to store city objects
    cities = []
    # Iterate through train_stops array
    train_stops.each() do |city|
      # Fetch id
      city_id = city.fetch('city_id').to_i
      # Use fetched id to search for the city object
        # Push the city object into the empty storage array
      cities.push(City.find(city_id))
    end
    # Returns the city objects that the train has stops at
    cities
  end

  define_method(:time_of_stop) do |city_id|
    result = DB.exec("SELECT time_of_stop FROM stops WHERE train_id = #{self.id} and city_id = #{city_id};")
    result.first().fetch('time_of_stop')
  end

  define_method(:==) do |other_train|
    self.name() == other_train.name() && self.id() == other_train.id()
  end


  define_method(:update) do |attributes|
    # Grabs name from argument, and sets it to @name
    @name = attributes.fetch(:name)
    @id = self.id()
    DB.exec("UPDATE train SET name = '#{@name}' WHERE id = #{@id};")
  end

  define_method(:delete) do
    DB.exec("DELETE FROM train WHERE id = #{self.id()};")
  end

  define_singleton_method(:find) do |identification|
    all_trains = Train.all()
    found_train = nil
    all_trains.each do |train|
      if train.id == identification
        found_train = train
      end
    end
    found_train
  end
end
