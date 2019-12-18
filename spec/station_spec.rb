require 'station'

describe Station do
    describe "#initializes" do
        let(:name) {"Old Street"}
        let(:zone) {1}
        let(:subject) {Station.new(name, zone)}

        it 'takes a zone on creation' do
            expect(subject.zone).to eq 1
        end

        it 'takes a name on creation' do
            expect(subject.name).to eq "Old Street"
        end
    end
end