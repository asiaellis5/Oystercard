class OysterCard
    
  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1
  attr_reader :balance, :entry_station
  attr_accessor :in_use

  def initialize(balance = 0)
      @balance = balance
      @entry_station = nil
  end

  def top_up(amount)
      @balance + amount < 90 ? @balance += amount : over_limit
  end

  def touch_in(location)
    @balance < MINIMUM_BALANCE ? insufficient_funds : @in_use = true
    @entry_station = location
  end

  def touch_out
    deduct
    @entry_station = nil
  end

  def in_journey?
    !!entry_station      # same as @entry_station != nil
  end

private

  def over_limit
    raise "Balance will exceed maximum of £#{MAXIMUM_BALANCE}, please try a lower amount"
  end

  def insufficient_funds
    raise "Insufficient funds, please top-up"
  end  

  def deduct
    @balance -= MINIMUM_BALANCE
  end



















end