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

  describe('.find') do
    it('returns a train by looking up its id')do
    test_train = Train.new({:id => nil, :name => 'Getro'})
    test_train.save()
                                      # Not expecting an array
    expect(Train.find(test_train.id())).to(eq(test_train))
    end
  end

  describe('#save') do
    it('returns the saved trains') do
      test_train = Train.new({:id => nil, :name => 'James'})
      test_train.save()
      expect(Train.all()).to(eq([test_train]))
    end
  end

  describe('#==') do
    it ('will override the == method') do
      test_train1 = Train.new({:id => nil, :name => 'James'})
      test_train2 = Train.new({:id => nil, :name => 'James'})
      expect(test_train1).to(eq(test_train2))
    end
  end

  describe('#update') do
    it ('updates a trains name') do
      test_train = Train.new({:id => nil, :name => 'Flora'})
      test_train.save()
      test_train.update({:name => 'Not Flora'})
      expect(test_train.name()).to(eq('Not Flora'))
    end
  end

  describe('#delete') do
    it('will delete a train') do
      test_train1 = Train.new({:id => nil, :name => 'leau'})
      test_train1.save()
      test_train2 = Train.new({:id => nil, :name => 'arbre'})
      test_train2.save()
      test_train1.delete()
      expect(Train.all()).to(eq([test_train2]))
    end
  end
end
