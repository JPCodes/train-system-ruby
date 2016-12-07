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

  define_method(:==) do |other_train|
    self.name() == other_train.name() && self.id() == other_train.id()
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

  define_method(:update) do |attributes|
    # Grabs name from argument? and sets it to @name
    @name = attributes.fetch(:name)
    @id = self.id()
    DB.exec("UPDATE train SET name = '#{@name}' WHERE id = #{@id};")
  end

end
