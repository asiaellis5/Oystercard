require_relative 'journey'

class JourneyLog
  attr_reader :journey_class, :starts, :journey_hist

  def initialize(journey_class)
    @journey_class = journey_class
    current_journey
    @journey_hist = []
  end

  def start(station)
    @current_journey.starts(station)
  end

  def finish(station)
    @current_journey.ends(station)
    reset
  end

  def journeys 
    @journey_hist.clone
  end

  private

  def reset
    @journey_hist << @current_journey
    @current_journey = Journey.new
  end

  def current_journey
    @current_journey ||= journey_class.new
  end

end