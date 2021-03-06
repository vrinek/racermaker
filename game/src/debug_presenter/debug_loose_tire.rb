require_relative './debug_collision_shape.rb'

# Draws a debug view of a loose tire on the track
class DebugLooseTire
  def initialize(model:)
    @debug_collision_shape = DebugCollisionShape.new(model.collision_shape)
  end

  def draw
    @debug_collision_shape.draw
  end
end
