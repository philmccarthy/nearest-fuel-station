class Route
  attr_reader :travel_time
  def initialize(data)
    @travel_time = data[:time].to_f / 60
    @legs = data[:legs]
  end

  def get_directions
    @legs.flat_map do |leg|
      leg[:maneuvers].map do |man|
        man[:narrative]
      end
    end
  end
end
