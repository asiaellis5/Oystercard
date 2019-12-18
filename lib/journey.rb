require_relative 'oystercard'
require_relative 'station'

class Journey
    attr_reader :journeys, :entry_station, :exit_station
    attr_accessor :station
    # MIN_FARE = 1
    # PENALTY = 6

    def initialize
        @entry_station = nil
        @exit_station = nil
        @journeys = []
    end

    def in_journey? 
        !!entry_station  # same as @entry_station != nil
    end

    def starts(station)
        @entry_station = station
    end

    def ends(station)
        @exit_station = station
        # record_journey 
        # @entry_station = nil
    end

    def complete?
        if @entry_station != nil && @exit_station != nil
            return true
        end
    end

    private

    # def record_journey
    #     journey = { :entry => @entry_station, :exit => @exit_station }
    #     @journeys << journey
    #     @entry_station = nil
    # end

    # def empty_journey
    #     @entry_station = nil
    # end
end