#Pattern State

class GreenState
  def go
    puts "The traffic light switches to the state: Green. You can move."
  end
end

class YellowState
  def go
    puts "The traffic light switches to the state: Yellow. Get ready to stop."
  end
end

class RedState
  def go
    puts "The traffic light switches to the state: Red. Stop."
  end
end


class TrafficLight
  attr_accessor :state
  def initialize
    @state = GreenState.new
  end

  def change_state(new_state)
    @state = new_state
  end

  def show_state
    @state.go
  end
end


traffic_light = TrafficLight.new
traffic_light.show_state


traffic_light.change_state(YellowState.new)
traffic_light.show_state


traffic_light.change_state(RedState.new)
traffic_light.show_state


