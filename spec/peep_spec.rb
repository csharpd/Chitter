require 'spec_helper'

describe 'Peep' do

  context "Demonstration that datamapper works" do
    it 'should be created then retrieved from the db' do
      expect(Peep.count).to eq(0)
      Peep.create(:content => "My first Peep!")
      expect(Peep.count).to eq(1)
      peep = Peep.first
      expect(peep.content).to eq("My first Peep!")
      peep.destroy
      expect(Peep.count).to eq(0)
    end
  end

end