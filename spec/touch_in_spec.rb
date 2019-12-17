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



  # describe '#touch in' do
  #   it 'touches in and return true' do
  #     subject.top_up(10)
  #     subject.touch_in
  #     expect(subject.in_use).to be true
  #   end
  #   it 'raises error when balance is below £1' do
  #     expect{ subject.touch_in}.to raise_error "Insufficient funds, please top-up"
  #   end
  # end
  
  # describe '#touch out' do
  #   it 'touches out and return false' do
  #     subject.touch_out
  #     expect(subject.in_use).to be false
  #   end
  #   it 'touches out and deducts by minimum' do
  #     subject.top_up(5)
  #     expect {subject.touch_out }.to change{ subject.balance }.by(- OysterCard::MINIMUM_BALANCE)
  #   end
  # end

end