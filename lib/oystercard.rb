require_relative 'journey'

class OysterCard
    
  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1
  attr_reader :balance, :entry_station, :exit_station
  attr_accessor :in_use, :journey

  def initialize(balance = 0, journey= Journey.new) 
      @balance = balance
      @journey = journey
  end

  def top_up(amount)
    exceeds_max(amount) ? @balance += amount : over_limit
  end

  def touch_in(station)
    deduct(Journey::PENALTY_CHARGE) if !@journey.entry_station.nil? && @journey.exit_station.nil?
    @journey.starts(station)
    insufficient_balance ? insufficient_funds : @in_use = true
  end

  def touch_out(station)
    @journey.ends(station)
    deduct(@journey.fare)
    @journey = Journey.new
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



















end