require 'journey_log'
require 'journey'

describe JourneyLog do
    subject{JourneyLog.new(Journey)}
    let(:entry_station){double :entry_station}
    let(:exit_station){double :exit_station}

    describe "#initialize" do
        it "is expected to initialize with a journey" do
        expect(subject.journey_class).is_a?(Journey)
        end
    end

    describe "#start" do
        it "starts a new journey with an entry station" do
            expect(subject.instance_variable_get(:@current_journey)).to receive(:starts).with(entry_station)
            subject.start(entry_station)
            # journey_class.starts(station)).to eq station
        end
    end

    describe "#finish" do
        it "ends a journey with an exit station" do
            expect(subject.instance_variable_get(:@current_journey)).to receive(:ends).with(exit_station)
            subject.finish(exit_station)
        end
    end

    describe "#journeys" do
        it "returns an immutable journeys array" do
            subject.start(entry_station)
            subject.finish(entry_station)
            expect {subject.journeys.pop}.not_to change{subject.journey_hist}
        end
    end
    
end

