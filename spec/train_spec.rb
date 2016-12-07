require('spec_helper')

describe(Train) do

  describe('.all') do
    it('returns empty at first') do
      expect(Train.all()).to(eq([]))
    end
  end

  describe('#id') do
    it('Returns id of the train') do
      test_train = Train.new(:id => nil, :name => 'Getro')
      test_train.save()
      expect(test_train.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe('#name') do
    it('Returns the name of the train') do
      test_train = Train.new({:id => nil, :name => 'Getro'})
      expect(test_train.name()).to(eq('Getro'))
    end
  end


  describe('#save') do
    it('returns the saved trains') do
      test_train = Train.new({:id => nil, :name => 'James'})
      test_train.save()
      expect(Train.all()).to(eq([test_train]))
    end
  end

end
