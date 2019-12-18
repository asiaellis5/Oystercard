require_relative 'journey'

class OysterCard
    
  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1
  MIN_FARE = 1
  PENALTY = 6
  attr_reader :balance, :entry_station, :exit_station, :journey_history, :places
  attr_accessor :in_use, :journey

  def initialize(balance = 0) 
    # journey = Journey.new)
      @balance = balance
      # @journey = nil
      @journey_history = []
  end

  def top_up(amount)
    @balance + amount < 90 ? @balance += amount : over_limit
  end

  def touch_in(station)
    @journey = Journey.new
    @journey.starts(station)
    @balance < MINIMUM_BALANCE ? insufficient_funds : @in_use = true
  end

  def touch_out(station)
    @journey.ends(station)
    @journey.complete? ? deduct(MIN_FARE): deduct(PENALTY)
    record_journey 
    @journey = Journey.new
    
  end

  def record_journey
    journey = { :entry => @journey.entry_station, :exit => @journey.exit_station }
    @journey_history << journey
    # @journey.entry_station = nil
  end

  # def fare
  #   @journey.complete? ? MIN_FARE : PENALTY
  # end

private

  def over_limit
    raise "Balance will exceed maximum of £#{MAXIMUM_BALANCE}, please try a lower amount"
  end

  def insufficient_funds
    raise "Insufficient funds, please top-up"
  end  

  def deduct(fare)
    @balance -= fare
  end

  

  # errors = {over_limit: raise "Balance will exceed maximum of £#{MAXIMUM_BALANCE}, please try a lower amount"}



















end