require_relative './interfaced_array.rb'
require_relative './interface/presentation.rb'

require_relative './presentation/present_track.rb'
require_relative './presentation/present_car.rb'
require_relative './presentation/present_loose_tire.rb'

# Presentation component for playing
class Presentation
  PRESENTERS = {
    'Car' => PresentCar,
    'LooseTire' => PresentLooseTire,
    'Track' => PresentTrack
  }

  def initialize(models:)
    @presentations = InterfacedArray.new(interface: Presentation)
    models.each do |model|
      presenter_class = PRESENTERS[model.class.to_s]
      next unless presenter_class
      @presentations << presenter_class.new(model: model)
    end
  end

  def draw
    @presentations.each(&:draw)
  end
end