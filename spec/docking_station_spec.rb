require 'docking_station.rb'

describe DockingStation do
  it "responds to release_bike" do
    expect(subject).to respond_to :release_bike
  end
  
  describe '#release_bike' do
    it 'releases a bike' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end

    it 'raises an error when there are no bikes available' do
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end

    it 'does not release broken bikes' do
      bike = Bike.new
      bike.report_broken
      subject.dock bike
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end
  end
  
  it "docks bikes" do
    bike = Bike.new
    expect(subject.dock(bike)).to eq [bike]
  end

  #it "returns docked bikes" do
  # bike = Bike.new
  #subject.dock(bike)
   # expect(subject.bikes).to eq [bike]
  #end

  describe '#dock' do
    it 'raises an error when full' do
        subject.capacity.times do
        subject.dock(Bike.new) 
      end
      expect { subject.dock(Bike.new) }.to raise_error 'Docking station full'
    end
  end

  it 'has a default capacity' do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

  describe 'initialization' do
    subject { DockingStation.new }
      let(:bike) { Bike.new }
      it 'defaults capacity' do
        described_class::DEFAULT_CAPACITY.times do
          subject.dock(bike)
        end
        expect{ subject.dock(bike) }.to raise_error 'Docking station full'
        end
      end
end