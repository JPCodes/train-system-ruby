require('spec_helper')

describe(City) do

  describe('.all') do
    it('returns empty at first') do
      expect(City.all()).to(eq([]))
    end
  end

  describe('#id') do
    it('Returns id of the city') do
      test_city = City.new({:id => nil, :name => 'Los Angeles'})
      test_city.save()
      expect(test_city.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe('#name') do
    it('Returns the name of the city') do
      test_city = City.new({:id => nil, :name => 'Ft. Lauderdale'})
      test_city.save()
      expect(test_city.name()).to(eq('Ft. Lauderdale'))
    end
  end

  describe('.find') do
    it('returns a city by looking up its id') do
      test_city = City.new({:id => nil, :name => 'Dallas'})
      test_city.save()
      expect(City.find(test_city.id())).to(eq(test_city))
    end
  end

  describe('#save') do
    it('returns the saved citys') do
      test_city = City.new({:id => nil, :name => 'Gainesville'})
      test_city.save()
      expect(City.all()).to(eq([test_city]))
    end
  end

  describe('#==') do
    it ('will override the == method') do
      test_city1 = City.new({:id => nil, :name => 'Miami'})
      test_city2 = City.new({:id => nil, :name => 'Miami'})
      expect(test_city1).to(eq(test_city2))
    end
  end

  describe('#update') do
    it ('updates a citys name') do
      test_city1 = City.new({:id => nil, :name => 'Jville'})
      test_city1.save()
      test_city1.update({:name => "Paris"})
      expect(test_city1.name).to(eq("Paris"))
    end
  end

  # describe('#delete') do
  #   it('will delete a city') do
  #
  #   end
  # end

end
