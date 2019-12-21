require_relative 'journey_log'

class OysterCard
    
  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1
  MIN_FARE = 1
  PENALTY_CHARGE = 6
  attr_reader :balance, :entry_station
  attr_accessor :in_use, :journey_log

  def initialize(balance = 0, journey_log = JourneyLog.new(Journey))
    # journey= Journey.new) 
      @balance = balance
      @journey_log = journey_log
      @in_use = false
  end

  def top_up(amount)
    exceeds_max(amount) ? @balance += amount : over_limit
  end

  def touch_in(station)
    deduct(PENALTY_CHARGE) if @in_use
    @journey_log.start(station)
    insufficient_balance ? insufficient_funds : @in_use = true
  end

  def touch_out(station)
    @journey_log.finish(station)
    deduct(fare)
    # @journey_log = JourneyLog.new(Journey)
    @in_use = false
  end

private

  def over_limit
    raise "Balance will exceed maximum of £#{MAXIMUM_BALANCE}, please try a lower amount"
  end

  def insufficient_funds
    raise "Insufficient funds, please top-up"
  end  

  def deduct(charge)
    @balance -= charge
  end

  def exceeds_max(amount)
    @balance + amount < MAXIMUM_BALANCE
  end

  def insufficient_balance
    @balance < MINIMUM_BALANCE
  end

  def fare
    @in_use ? MIN_FARE : PENALTY_FARE
  end
end