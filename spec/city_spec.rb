require('spec_helper')

describe(City) do

  describe('.all') do
    it('returns empty at first') do
      expect(City.all()).to(eq([]))
    end
  end

  describe('#id') do
    it('Returns id of the train') do

    end
  end

  describe('#name') do
    it('Returns the name of the train') do

    end
  end

  describe('.find') do
    it('returns a train by looking up its id')do

    end
  end

  describe('#save') do
    it('returns the saved trains') do

    end
  end

  describe('#==') do
    it ('will override the == method') do

    end
  end

  describe('#update') do
    it ('updates a trains name') do

    end
  end

  describe('#delete') do
    it('will delete a train') do

    end
  end

end
