require 'oystercard'

describe OysterCard do

  describe '#initialization' do
    it { expect(subject.balance).to eq 0 }
    
  end

  describe '#top_up' do
    it { expect(subject).to respond_to :top_up }
    it { expect{ subject.top_up(10) }.to change{ subject.balance }.by 10 }
    it { expect{ subject.top_up(91) }.to raise_error "Balance will exceed maximum of £#{OysterCard::MAXIMUM_BALANCE}, please try a lower amount" }
  end

  describe '#touch in' do
    let(:old_street){"Old Street"}

    it 'touches in and return true' do
      subject.top_up(10)
      subject.touch_in(old_street)
      expect(subject.in_use).to be true
    end

    it 'raises error when balance is below £1' do
      old_street = double("Old Street")
      expect{ subject.touch_in(old_street) }.to raise_error "Insufficient funds, please top-up"
    end

  end
  
  describe '#touch out' do
    let(:old_street){ "Old Street" }
    let(:king_cross){"Kings Cross"}
    before(:each) { 
      subject.top_up(10)
      subject.touch_in(old_street)
    }
 
    it 'touches out and deducts by minimum' do
      expect {subject.touch_out(king_cross) }.to change{ subject.balance }.by(- OysterCard::MINIMUM_BALANCE)
    end

    it 'forgets the entry station on touch out by setting it to nil' do
      subject.touch_out(king_cross)
      expect(subject.entry_station).to eq nil
    end
  end

    describe '#record_journey' do
      let(:old_street){ "Old Street" }
      let(:king_cross){ "Kings Cross" }
      let(:journey){{:entry => old_street, :exit => king_cross}}
  
      before(:each) do
        subject.top_up(20)
        subject.touch_in(old_street)
        subject.touch_out(king_cross)
      end
  
      it 'remembers the history of all journeys' do
        expect(subject.journey_history).to include journey
      end
    end

    describe '#fares' do
      let(:old_street){ "Old Street" }
      let(:king_cross){ "Kings Cross" }
      
      it 'adds a minimum fare if journey complete' do
        subject.top_up(20)
        subject.touch_in(old_street)
        subject.touch_out(king_cross)
        expect(subject.balance).to eq 19
      end

      it "returns a penalty fare when no exit station given" do
        subject.top_up(20)
        subject.touch_in(old_street)
        subject.touch_out(nil)
        expect(subject.balance).to eq 14
      end
      
      it "returns a penalty fare when dont touch out" do
        subject.top_up(20)
        subject.touch_in(old_street)
        subject.touch_in(king_cross)
        expect(subject.balance).to eq 14
      end
    end


  

  
end