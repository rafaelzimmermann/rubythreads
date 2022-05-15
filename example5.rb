
class ThreadTest
  def initialize
    @counter = nil
  end

  def add(value, increment)
    value + increment
  end

  def run
    100.times.map do 
      Thread.new do
        sleep(0.1)
        100_000.times do
        @counter ||= 0
        @counter = add(@counter, 1)
      end
    end
    end.each(&:join)
    puts @counter
  end
end

t = ThreadTest.new
t.run