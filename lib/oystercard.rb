require_relative 'journey'

class OysterCard
    
  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1
  attr_reader :balance, :entry_station, :exit_station, :journeys, :places
  attr_accessor :in_use

  def initialize(balance = 0, journey = Journey.new)
      @balance = balance
      @journey = journey
      @places = []
  end

  def top_up(amount)
    @balance + amount < 90 ? @balance += amount : over_limit
  end

  def touch_in(station)
    @journey.starts(station)
    @balance < MINIMUM_BALANCE ? insufficient_funds : @in_use = true
  end

  def touch_out(station)
    @journey.ends(station)
    deduct
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

  # errors = {over_limit: raise "Balance will exceed maximum of £#{MAXIMUM_BALANCE}, please try a lower amount"}



















end