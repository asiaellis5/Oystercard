require_relative 'journey'

class JourneyLog
  attr_reader :journey_class

  def initialize(journey_class = Journey.new)
    @journey_class = journey_class
  end

  def start(station)
    @journey_class.starts(station)
  end

end