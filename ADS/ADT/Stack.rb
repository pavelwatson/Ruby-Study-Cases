class Stack
  def initialize
    @underlying_array = []
  end

  def push(el)
    @underlying_array.push(el)
    el
  end

  def pop
    @underlying_array.pop
  end

  def top
    @underlying_array.last
  end

  def empty?
    @underlying_array.length == 0
  end
end
