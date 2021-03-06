require_relative "bike"

class DockingStation
  attr_reader :bikes
  attr_reader :capacity
  DEFAULT_CAPACITY = 20
  
  def initialize(capacity=DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    fail "No bikes available" if broken_bike?
    fail 'No bikes available' if empty?
    bikes.pop
  end

  def dock(bike)
    fail 'Docking station full' if full?
    bikes << bike
  end

  private

  attr_reader :bikes

  def full?
    bikes.count >= capacity
  end 

  def empty?
    bikes.empty?
  end

  def broken_bike?
    bike = Bike.new
    bike.report_broken
    bikes.include?(bike)
  end

end