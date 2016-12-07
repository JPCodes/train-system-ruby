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

    end
  end

  describe('.find') do
    it('returns a city by looking up its id')do

    end
  end

  describe('#save') do
    it('returns the saved citys') do

    end
  end

  describe('#==') do
    it ('will override the == method') do

    end
  end

  describe('#update') do
    it ('updates a citys name') do

    end
  end

  describe('#delete') do
    it('will delete a city') do

    end
  end

end
