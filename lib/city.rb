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

end
