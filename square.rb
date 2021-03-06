class Square
  attr_accessor :type, :position
  def initialize(type, position)
    @type = type
    @position = position
  end
end

class Type
  def initialize(x_or_o)
    @type = x_or_o
  end

  def x?
    @type == 'X'
  end

  def o?
    @type == 'O'
  end

  def to_s
    @type
  end

  def to_i
    @type == 'X' ? 1 : 0
  end
end

class Position
  attr_reader :row, :col
  def initialize(row, col)
    if %w(top middle bottom).include?(row)
      @row = row
    end
    if %w(left center right).include?(col)
      @col = col
    end
    raise ArgumentError if @col.nil? || @row.nil?
  end

  def row_i
    if @row == 'top'
      0
    elsif @row == 'middle'
      1
    elsif @row == 'bottom'
      2
    end
  end

  def col_i
    if @col == 'left'
      0
    elsif @col == 'center'
      1
    elsif @col == 'right'
      2
    end
  end

  def left_diaganal?
    yield if @row == 'top' && @col == 'left' || @row == 'middle' && @col == 'center' || @row == 'bottom' && @col == 'right'
  end

  def right_diaganal?
    yield if @row == 'top' && @col == 'right' || @row == 'middle' && @col == 'center' || @row == 'bottom' && @col == 'left'
  end

  def to_a
    [@row, @col]
  end

  def to_s
    @row.to_s + ', ' + @col.to_s
  end
end
