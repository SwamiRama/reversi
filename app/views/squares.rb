require 'green_shoes'

class Squares
  def initialize(left, top, width, color)
    fill color
    rect left: left, top: top, width: width
  end
end
