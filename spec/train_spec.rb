require('spec_helper')

describe(Train) do

  describe('#id') do
    it('Returns id of the train') do
      test_train = Train.new(:id => nil)
      expect().to(eq())
    end
  end

end
