require_relative 'journey'

class JourneyLog
  attr_reader :journey_class, :starts

  def initialize(journey_class)
    @journey_class = journey_class
    current_journey
    @journeys = []
  end

  def start(station)
    @current_journey.starts(station)
  end

  def finish(station)
    @current_journey.ends(station)
    reset
  end

  private

  def reset
    @journeys << @current_journey
    @current_journey = Journey.new
  end

  def current_journey
    @current_journey ||= journey_class.new
  end

end