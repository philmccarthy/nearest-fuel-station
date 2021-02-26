class Route
  attr_reader :travel_time
  def initialize(data)
    @travel_time = data[:time].to_f / 60
    @legs = data[:legs]
  end

  def get_directions
    @legs[0][:maneuvers].map do |maneuver|
      maneuver[:narrative]
    end
  end
end
