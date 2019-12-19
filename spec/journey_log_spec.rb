require 'journey_log'

describe JourneyLog do

    describe "#initialize" do
        it "is expected to initialize with a journey" do
        expect(subject.journey_class).is_a?(Journey)
        end
    end

    describe "#start" do
        let (:station){double(:station)}
        it "starts a new journey with an entry station" do
        expect(subject.journey_class.starts(station)).to eq station
        end
    end
    
end

