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
      id = city.fetch('id')
      result.push(City.new({:id => id, :name => name}))
    end
    result
  end

  define_method(:==) do |other_train|

  end

  define_singleton_method(:find) do |identification|

  end

  define_method(:update) do |attributes|

  end

end
