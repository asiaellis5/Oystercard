require 'journey'

describe Journey do
  
  describe 'initialization' do
    it 'has empty list of journeys by default' do
      expect(subject.journeys).to eq [] 
    end
  end

  describe '#starts' do
    let(:old_street){"Old Street"}
    before (:each) do
      subject.starts(old_street)
    end

    it 'shows card is in journey after touching in' do
      expect(subject.in_journey?).to eq true
    end

    it 'remembers the entry station after touch in' do
      expect(subject.entry_station).to eq old_street
    end

    context "given an entry station" do
      let(:other_station) {double :other_station}
    end

  end

  describe '#ends' do
    let(:old_street) {"Old Street"}
    let(:kings_cross) {"Kings Cross"}
    before(:each) do 
      subject.starts(old_street)
    end

  describe "#complete?" do
    let(:old_street) {"Old Street"}
    let(:kings_cross) {"Kings Cross"}
      
    before (:each) do
      subject.starts(old_street)
    end

    it "knows if a journey is complete?" do
      subject.ends(kings_cross)
      expect(subject).to be_complete
    end
  end

  end
end  