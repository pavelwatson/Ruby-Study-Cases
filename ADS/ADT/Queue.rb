class Queue
  def initialize
    @underlying_array = []
  end

  def enqueue(el)
    @underlying_array.push(el)
    el
  end

  def dequeue
    @underlying_array.shift
  end

  def head
    @underlying_array.first
  end

  def empty?
    @queue.length == 0
  end
end
