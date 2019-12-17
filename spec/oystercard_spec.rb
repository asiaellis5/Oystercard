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
    it 'remembers the entry station after touch in' do

      # expect{ subject.touch_in(location) }.to eq location
    end
  end
  
  describe '#touch out' do
    let(:old_street){ "Old Street" }
    before(:each) { 
      subject.top_up(10)
      subject.touch_in(old_street)
    }

    it 'touches out and return false' do
      subject.touch_out
      expect(subject.in_journey?).to be false
    end
    it 'touches out and deducts by minimum' do
      expect {subject.touch_out }.to change{ subject.balance }.by(- OysterCard::MINIMUM_BALANCE)
    end
    it 'forgets the entry station on touch out by setting it to nil' do
      subject.touch_out
      expect(subject.entry_station).to eq nil
    end
  end

end