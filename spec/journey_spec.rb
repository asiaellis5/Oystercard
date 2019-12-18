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

  end

  describe '#ends' do
    let(:old_street) {"Old Street"}
    let(:kings_cross) {"Kings Cross"}
    before(:each) do 
      subject.starts(old_street)
    end

    it 'touches out and return false' do
      subject.ends(kings_cross)
      expect(subject.in_journey?).to be false
    end

  end

  describe '#record_journey' do
    let(:old_street){ "Old Street" }
    let(:king_cross){ "Kings Cross" }
    let(:journey){{:entry => old_street, :exit => king_cross}}

    before(:each) do
      subject.starts(old_street)
      subject.ends(king_cross)
    end

    it 'remembers the history of all journeys' do
      expect(subject.journeys).to include journey
    end
    
    # it 'remembers the history of all journeys' do
    #   expect(subject.journeys[0]).to eq {:touch_in => old_street, :touch_out => king_cross}
    # end
  end

  describe '#fare' do
    let(:old_street){ "Old Street" }
    let(:king_cross){ "Kings Cross" }
    
      

    it 'adds a minimum fare if journey complete' do
      subject.starts(old_street)
      subject.ends(king_cross)
      p subject.complete?
      expect(subject.fare).to eq 1
    end
  end

end  