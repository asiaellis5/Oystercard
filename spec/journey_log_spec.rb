require 'journey_log'
require 'journey'

describe JourneyLog do
    subject{JourneyLog.new(Journey)}

    describe "#initialize" do
        it "is expected to initialize with a journey" do
        expect(subject.journey_class).is_a?(Journey)
        end
    end

    describe "#start" do
        let(:entry_station){double :entry_station}
        it "starts a new journey with an entry station" do
            expect(subject.instance_variable_get(:@current_journey)).to receive(:starts).with(entry_station)
            subject.start(entry_station)
            # journey_class.starts(station)).to eq station
        end
    end

    describe "#finish" do
        let(:exit_station){double :exit_station}
        it "ends a journey with an exit station" do
            expect(subject.instance_variable_get(:@current_journey)).to receive(:ends).with(exit_station)
            subject.finish(exit_station)
        end
    end
    
end

